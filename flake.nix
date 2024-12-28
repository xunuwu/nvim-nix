{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    nixvim,
    self,
    ...
  }: let
    pkgs = import nixpkgs {system = "x86_64-linux";};
    l = pkgs.lib // builtins;
    nvim = nixvim.legacyPackages.${pkgs.system}.makeNixvimWithModule {
      extraSpecialArgs.mylib = let
        nhelpers = nixvim.lib.nixvim;
        wrapFn = vars: attrs: let
          varsLua = l.mapAttrsToList (n: v: "local ${n} = ${v}") vars;
        in "function() ${l.concatStringsSep "\n" varsLua} return ${nhelpers.toLuaObject attrs} end";
      in {
        inherit nhelpers wrapFn;
      };

      module = ./config;
    };
  in {
    devShells.${pkgs.system}.default = pkgs.mkShellNoCC {packages = [nvim];};
    packages.${pkgs.system}.default = nvim;
  };
}

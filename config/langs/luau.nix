{pkgs, ...}: let
  lspPkg = pkgs.callPackage ./_luau-lsp.nix {};
in {
  extraPackages = [lspPkg];
  extraPlugins = with pkgs; [
    (vimUtils.buildVimPlugin {
      name = "luau-lsp.nvim";
      src = fetchFromGitHub {
        owner = "lopi-py";
        repo = "luau-lsp.nvim";
        rev = "a553feab030f42481e6ec79a2e2e242a04400af1";
        hash = "sha256-nbwQ6LaXOJMa5+yvQHVp7mKA+FYi2UAA0AP5OwHYY1o=";
      };
    })
    vimPlugins.plenary-nvim
  ];
  extraConfigLua = ''
    require("luau-lsp").setup({
       platform = { type = "standard" },
       sourcemap = { enabled = false },
    })
  '';
}

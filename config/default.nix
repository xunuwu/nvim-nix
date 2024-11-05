{lib, ...}: let
  l = lib;
  b = builtins;
in {
  imports = let
    shouldImport = n: t: t == "directory" || ((!l.hasPrefix "_" n) && l.hasSuffix ".nix" n);
    paths = dir:
      l.pipe dir [
        b.readDir
        (l.filterAttrs shouldImport)
        (l.mapAttrsToList (relpath: type:
          if type != "directory"
          then [/${dir}/${relpath}]
          else paths /${dir}/${relpath}))
        b.concatLists
      ];
  in
    b.filter (x: x != ./default.nix) (paths ./.);
}

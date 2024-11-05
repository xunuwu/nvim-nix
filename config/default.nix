{lib,...}:let
  l = lib;
  b = builtins;
in {
  imports = let
    shouldImport = x: !l.hasPrefix "_" x && l.hasSuffix ".nix" x;
    paths = dir: b.readDir dir |>
      l.mapAttrsToList (relpath: type:
         if type != "directory"
         then [/${dir}/${relpath}]
         else paths /${dir}/${relpath}
      ) |> b.concatLists |> b.filter shouldImport;
  in paths ./. |> b.filter (x: x != ./default.nix);
}

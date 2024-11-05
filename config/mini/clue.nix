{lib, ...}: let
  l = lib // builtins;
in {
  plugins.mini.modules.clue = {
    triggers = let
      conversion = keys: map (mode: {inherit mode keys;});
      generate = x: l.concatLists (l.mapAttrsToList conversion x);
    in
      generate {
        "<leader>" = ["n" "x"];
        "g" = ["n" "x"];
        "'" = ["n" "x"];
        "`" = ["n" "x"];
        "\"" = ["n" "x"];
        "<C-r>" = ["i" "c"];
        "<C-w>" = ["n"];
        "z" = ["n" "x"];
      };
    clues.__raw = ''
      {
         require('mini.clue').gen_clues.g(),
         require('mini.clue').gen_clues.marks(),
         require('mini.clue').gen_clues.registers(),
         require('mini.clue').gen_clues.windows(),
         require('mini.clue').gen_clues.z(),
      }
    '';
    window = {
      delay = 150;
    };
  };
}

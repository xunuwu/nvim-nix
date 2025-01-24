let
  autoFormatFt = [
    "nix"
    "lua"
    "luau"
    "zig"
  ];
in {
  plugins.conform-nvim = {
    enable = true;
    settings = {
      notify_on_error = true;
      formatters_by_ft = {
        lua = ["stylua"];
        luau = ["stylua"];
        nix = ["alejandra"];
        zig = ["zigfmt"];
        c = ["clang-format"];
        cpp = ["clang-format"];
        rust = ["rustfmt"];
        elixir = ["mix"];
      };
    };
  };
  autoCmd = [
    {
      pattern = builtins.concatStringsSep "," (map (x: "*.${x}") autoFormatFt);
      event = ["BufWritePre"];
      callback.__raw = "function(args) require('conform').format({ bufnr = args.buf }) end";
    }
  ];
  keymaps = [
    {
      action.__raw = "require('conform').format";
      key = "<leader>lf";
      options.desc = "Format";
    }
  ];
}

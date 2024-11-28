{mylib, ...}: {
  keymaps = [
    {
      action.__raw = "MiniPick.builtin.files";
      key = "<leader>sf";
      options.desc = "Search files";
    }
    {
      action.__raw = "MiniPick.builtin.grep_live";
      key = "<leader>sd";
      options.desc = "Search grep live";
    }
    {
      action.__raw = "MiniPick.builtin.help";
      key = "<leader>sh";
      options.desc = "Search help";
    }
    {
      action.__raw = "function() MiniExtra.pickers.git_branches(nil, 'local') end";
      key = "<leader>sb";
      options.desc = "Switch git branch";
    }
    {
      action.__raw = "MiniExtra.pickers.registers";
      key = "<leader>sr";
      options.desc = "Search registers";
    }
  ];
  plugins.mini.modules.pick = {
    options.use_cache = true;
    window.config.__raw =
      mylib.wrapFn {
        height = "math.floor(0.618 * vim.o.lines)";
        width = "math.floor(0.618 * vim.o.columns)";
      } {
        anchor = "NW";
        border = "single";
        height.__raw = "height";
        width.__raw = "width";
        row.__raw = "math.floor(0.5 * (vim.o.lines - height))";
        col.__raw = "math.floor(0.5 * (vim.o.columns - width))";
      };
  };
}

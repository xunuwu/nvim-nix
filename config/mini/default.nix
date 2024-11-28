{
  keymaps = [
    {
      action.__raw = "require('mini.misc').zoom";
      key = "<leader>oz";
      options.desc = "Zoom";
    }
  ];

  plugins.mini = {
    enable = true;
    mockDevIcons = true;
    modules = {
      icons = {};
      indentscope = {};
      misc = {};
      trailspace = {};
      ai = {};
      align = {};
      pairs = {};
      git = {};
      extra = {};
    };
  };
}

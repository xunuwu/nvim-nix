{
  keymaps = [
    {
      action.__raw = "function() MiniFiles.open(vim.fn.expand('%:h')) end";
      key = "<leader>e";
      options.desc = "Explore files";
    }
  ];
  plugins.mini.modules.files = {
    windows.preview = true;
  };
}

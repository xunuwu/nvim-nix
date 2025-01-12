{
  clipboard.register = "unnamedplus"; # TODO remove and manually use system clipboard instead with <leader>{y,p}
  opts = {
    termguicolors = true;
    number = true;
    relativenumber = true;
    signcolumn = "yes";
    scrolloff = 4;
    cursorline = true;
    wrap = false;

    expandtab = true;
    tabstop = 3;
    softtabstop = 3;
    shiftwidth = 3;

    smartindent = true;

    undofile = true;
  };
  globals = {
    mapleader = " ";
    maplocalleader = ",";
  };
  keymaps = [
    {
      action = "<C-w>";
      key = "<space>w";
      mode = "n";
      options = {
        desc = "Window management";
        silent = true;
      };
    }
    {
      action = "<C-\\><C-n>C-w>";
      key = "<esc><esc>";
      mode = "t";
      options = {
        desc = "Exit terminal mode";
        silent = true;
      };
    }
  ];
  colorscheme = "carbonfox";
  colorschemes = {
    # catppuccin.enable = true;
    # modus.enable = true;
    nightfox.enable = true;
  };

  luaLoader.enable = true;
  performance = {
    byteCompileLua = {
      # enable = true;
      nvimRuntime = true;
      plugins = true;
    };
    ## TODO enable this (and fix eventual collisions)
    ## it speeds up startup time by a LOT!!
    #
    # combinePlugins = {
    #   enable = true;
    #   standalonePlugins = [
    #     "nvim-treesitter"
    #     "vimplugin-treesitter-grammar-nix"
    #   ];
    # };
  };
}

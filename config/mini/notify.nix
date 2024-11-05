{mylib, ...}: {
  extraConfigLua = ''
    vim.notify = require("mini.notify").make_notify({
      ERROR = { duration = 5000 },
    })
  '';
  userCommands."Notifyhistory" = {
    command.__raw = "require('mini.notify').show_history";
    desc = "Show mini.notify history";
  };
  plugins.mini.modules.notify = {
    window.config.__raw =
      mylib.wrapFn {
        has_statusline = "vim.o.laststatus > 0";
        bottom_space = "vim.o.cmdheight + (has_statusline and 1 or 0)";
      } {
        border = "single";
        anchor = "SE";
        col.__raw = "vim.o.columns";
        row.__raw = "vim.o.lines - bottom_space";
      };
  };
}

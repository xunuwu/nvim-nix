{
  extraFiles."after/ftplugin/rust.lua".text = ''
    local bufnr = vim.api.nvim_get_current_buf()
    vim.keymap.set("n", "<leader>la", function()
      vim.cmd.RustLsp("codeAction")
    end, { buffer = bufnr, silent = true, desc = "Code action" })
    vim.keymap.set("n", "<leader>pd", function()
      vim.cmd.RustLsp("renderDiagnostic")
    end, { buffer = bufnr, silent = true, desc = "Render diagnostic" })
    vim.keymap.set("n", "<leader>pD", function()
      vim.cmd.RustLsp("openDocs")
    end, { buffer = bufnr, silent = true, desc = "Docs" })
    vim.keymap.set("n", "<leader>pe", function()
      vim.cmd.RustLsp("explainError")
    end, { buffer = bufnr, silent = true, desc = "Explain error" })
    vim.keymap.set("n", "<leader>pr", function()
      vim.cmd.RustLsp("runnables")
    end, { buffer = bufnr, silent = true, desc = "Run" })
  '';

  plugins.rustaceanvim = {
    enable = true;
    # settings.server.default_settings.rust-analyzer = {
    #   inlayHints = {
    #     chainingHints.enable = true;
    #     parameterHints.enable = true;
    #     typeHints.enable = true;
    #   };
    #   check = {
    #     allTargets = false;
    #     command = "clippy";
    #     features = "all";
    #   };
    #   cargo = {
    #     features = "all";
    #   };
    # };

    rustAnalyzerPackage = null;
  };
}

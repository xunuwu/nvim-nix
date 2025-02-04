{
  # TODO dap-virtual-text
  plugins = {
    dap-virtual-text.enable = true;
    dap-ui.enable = true;
    dap = {
      enable = true;
      adapters.executables = {
        gdb = {
          command = "gdb";
          args = ["-i" "dap"];
        };
        lldb = {
          command = "lldb-dap";
        };
      };
      configurations = {
        c = [
          {
            name = "Launch (gdb)";
            type = "gdb";
            request = "launch";
            program.__raw = ''
              function() return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file") end
            '';
            cwd = "\${workspaceFolder}";
          }
          {
            name = "Launch (lldb)";
            type = "lldb";
            request = "launch";
            program.__raw = ''
              function() return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file") end
            '';
            cwd = "\${workspaceFolder}";
          }
        ];
      };
    };
  };
  # plugins.hydra.hydras = [
  #   {
  #     body = "<leader>md";
  #     mode = ["n" "v"];
  #     config = {
  #       color = "";
  #     };
  #   }
  # ];
}

{pkgs, ...}: {
  plugins = {
    lsp = {
      enable = true;
      keymaps = {
        diagnostic = {
          "<leader>j" = "goto_next";
          "<leader>k" = "goto_prev";
          "<C-k>" = "open_float";
        };
        lspBuf = {
          "K" = "hover";
          "<leader>ld" = {
            action = "definition";
            desc = "Go to definition";
          };
          "<leader>lD" = {
            action = "declaration";
            desc = "Declaration";
          };
          "<leader>li" = {
            action = "implementation";
            desc = "Implementation";
          };
          "<leader>lr" = {
            action = "rename";
            desc = "Rename";
          };
          "<leader>lR" = {
            action = "references";
            desc = "Find references";
          };
          "<leader>la" = {
            action = "code_action";
            desc = "Run code action";
          };
        };
        extra = [
          {
            key = "<leader>lh";
            action.__raw = "function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end";
            options.desc = "Toggle inlay hints";
          }
        ];
      };
      servers = {
        nil_ls.enable = true;
        nixd.enable = true;
        clangd = {
          enable = true;
          package = null;
        };
        lua_ls.enable = true;
        # luau_lsp = {
        #   enable = true;
        #   package = pkgs.callPackage ./_luau.nix {};
        # };
        ts_ls.enable = true;
        zls.enable = true;
      };
    };

    blink-cmp = {
      enable = true;
      settings = {
        highlight.use_nvim_cmp_as_default = true;
        documentation = {
          auto_show = true;
          auto_show_delay_ms = 250;
        };
      };
    };
  };
}

{...}: {
  plugins = {
    none-ls = {
      enable = true;

      sources = {
        completion = {
          luasnip.enable = true;
        };
        formatting = {
          alejandra.enable = true;
          stylua.enable = true;
          mdformat.enable = true;
        };
      };
    };

    trouble.enable = true;

    cmp = {
      enable = true;
      settings = {
        window = {
          completion.sctollbar = false;
        };
        autoEnableSources = true;
        sources = [
          {name = "nvim_lsp";}
          {name = "path";}
          {name = "luasnip";}
          {name = "conventionalcommits";}
          {name = "clippy";}
          {name = "yaml";}
          #{name = "dap";}
        ];

        mapping = {
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<Tab>" = ''
              cmp.mapping(function(fallback)
                if cmp.visible() then
                  cmp.select_next_item()
            elseif require("luasnip").expand_or_locally_jumpable() then
                  require("luasnip").expand_or_jump()
                else
                  fallback()
                end
              end, { "i", "s" })
          '';
          "<C-Tab>" = ''
            cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              elseif require("luasnip").jumpable(-1) then
                require("luasnip").jump(-1)
              else
                fallback()
              end
            end, { "i", "s" })
          '';
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-e>" = "cmp.mapping.abort()";
          "<Up>" = "cmp.mapping.select_prev_item()";
          "<Down>" = "cmp.mapping.select_next_item()";
        };
      };
    };

    lsp = {
      enable = true;
      servers = {
        lua_ls.enable = true;
        nil_ls.enable = true;
        rust_analyzer = {
          enable = true;
          installCargo = false;
          installRustc = false;
        };
        ts_ls.enable = true;
        zls.enable = true;
        ccls.enable = true;
      };

      keymaps = {
        lspBuf = {
          K = "hover";
          gd = "definition";
          gD = "references";
          "<leader>ca" = "code_action";
        };
      };
    };
  };
}

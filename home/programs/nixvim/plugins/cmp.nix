{
  enable = true;
  settings = {
    window = {
      completion = {
        scrollbar = false;
      };
    };
    autoEnableSources = true;
    sources = [
      {name = "nvim_lsp";}
      {name = "path";}
      {name = "luasnip";}
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
}

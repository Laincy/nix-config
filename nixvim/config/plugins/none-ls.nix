{...}: {
  plugins.none-ls = {
    enable = true;
    sources = {
      formatting = {
        alejandra.enable = true;
        stylua.enable = true;
			};
      completion = {
        luasnip.enable = true;
      };
    };
  };

  keymaps = [
    {
      action = "<CMD>lua vim.lsp.buf.format()<CR>";
      key = "<leader>fmt";
    }
  ];
}

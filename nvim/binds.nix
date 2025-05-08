{...}: {
  globals.mapleader = " ";

  keymaps = [
    {
      action = "<cmd>lua vim.diagnostic.open_float()<CR>";
      key = "<leader>e";
    }

    {
      action = ":Neotree filesystem toggle left<CR>";
      key = "<C-n>";
    }

    {
      action = "<cmd>lua vim.lsp.buf.format()<CR>";
      key = "<leader>fmt";
    }
    {
      action = "<cmd>Trouble diagnostics toggle<cr>";
      key = "<leader>xx";
    }
  ];
}

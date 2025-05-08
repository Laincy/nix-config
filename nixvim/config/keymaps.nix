{self, ...}: {
  globals.mapleader = " ";

  keymaps = [
    {
      action = "<cmd>lua vim.diagnostic.open_float()<CR>";
      key = "<leader>e";
    }
  ];
}

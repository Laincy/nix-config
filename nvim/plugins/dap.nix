{...}: {
  plugins = {
    dap = {
      enable = true;
      settings = {
        mapping = {
          "<leader>dt" = "dap.toggle_breakpoint()";
          "<leader>dc" = "dap.continue()";
        };
      };
    };
  };
}

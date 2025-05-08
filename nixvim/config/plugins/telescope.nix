{...}: {
  plugins.telescope = {
    enable = true;
    keymaps = {
      "<C-f>" = {
        action = "find_files";
      };
      "<leader>fg" = {
        action = "live_grep";
      };
			"<leader>b" = {
				action = "buffers";
			};
    };
  };
}

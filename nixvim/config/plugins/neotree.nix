{...}: {
  plugins.neo-tree = {
    enable = true;
    closeIfLastWindow = true;

    window = {
      width = 30;
    };

    filesystem.filteredItems = {
      hideGitignored = false;
			alwaysShow = [
        ".gitignore"
				".env"
      ];
    };
  };
  keymaps = [
    {
      action = ":Neotree filesystem toggle left<CR>";
      key = "<C-n>";
      options.silent = true;
    }
  ];
}

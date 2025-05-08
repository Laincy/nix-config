{...}: {
	imports = [
			./lsp.nix
			./neotree.nix
			./telescope.nix
			./treesitter.nix
	];

	plugins = {
		web-devicons.enable = true;

		lualine = {
			enable = true;
			settings.options.globalstatus = true;
		};

		markview = {
			enable = true;

			settings.links.hyperlinks.enable = true;
		};

		presence-nvim.enable = true;
	};
			 }

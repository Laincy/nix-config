{...}: {
  plugins.lsp = {
    enable = true;
    servers = {
      nil_ls.enable = true;
      nushell.enable = true;
      rust_analyzer = {
        enable = true;
        installCargo = false;
        installRustc = false;
      };
    };

		keymaps = {
			lspbuf = {
				K = "hover";
				gd = "definition";
				gD = "references";
				"<leader>ca" = "code_action";
			};
		};
  };
}

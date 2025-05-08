{
  enable = true;
  servers = {
    nil_ls.enable = true;
    nushell.enable = true;
    rust_analyzer = {
      enable = true;
      installCargo = false;
      installRustc = false;
    };
    lua_ls.enable = true;
    zls.enable = true;
		marksman.enable = true;
		wgsl_analyzer.enable = true;
  };

  keymaps = {
    lspBuf = {
      K = "hover";
      gd = "definition";
      gD = "references";
      "<leader>ca" = "code_action";
    };
  };
}

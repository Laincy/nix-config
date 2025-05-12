{config, ...}: {
  programs = {
    starship = {
      enable = true;
      enableNushellIntegration = true;
    };

    nushell = {
      enable = true;
      extraConfig = ''
        $env.editor = "${config.home.sessionVariables.EDITOR}"
        $env.GPG_TTY = (tty)
				$env.config.show_banner = false
      '';
    };
  };
}

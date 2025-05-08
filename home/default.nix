{
  config,
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.impermanence.nixosModules.home-manager.impermanence
    ./desktop
    ./programs
  ];

  home = {
    username = "laincy";
    homeDirectory = "/home/${config.home.username}";
    stateVersion = "24.05";

    persistence."/persist/home/${config.home.username}" = {
      directories = [
        "Documents"
        "Downloads"
        "Pictures"
        "Programming"
      ];

      allowOther = true;
    };

    sessionVariables = {
      EDITOR = "nvim";
      TERM = "alacritty";
      BROWSER = "firefox";
      MENU_CMD = "${pkgs.wofi}/bin/wofi -S drun";
    };
  };


  gtk = {
    enable = true;

    iconTheme = {
      name = "Adwitia";
      package = pkgs.adwaita-icon-theme;
    };
  };
}

{
  config,
  inputs,
  pkgs,
  ...
}: {
  imports = [
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
    };
  };

  xdg.portal = {
    enable = true;
    config = {
      common.default = [
        "gtk"
      ];
    };
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland
    ];
    xdgOpenUsePortal = true;
  };
  stylix.targets.gtk.flatpakSupport.enable = false;
  gtk = {
    enable = true;

    iconTheme = {
      name = "Adwitia";
      package = pkgs.adwaita-icon-theme;
    };
  };
}

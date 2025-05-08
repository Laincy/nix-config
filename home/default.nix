{
  config,
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./desktop
    ./programs

    ./theme.nix
  ];

  home = {
    username = "laincy";
    homeDirectory = "/home/${config.home.username}";
    stateVersion = "24.05";

    persistence."/persist${config.home.homeDirectory}" = {
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
    };
  };

  xdg.portal = {
    enable = true;
    config.common.default = [
      "gtk"
    ];
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland
    ];
    xdgOpenUsePortal = true;
  };
}

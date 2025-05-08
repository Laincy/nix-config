{
  config,
  inputs,
  pkgs,
  ...
}: let
  hypr_pkg = inputs.hyprland.packages.${pkgs.system};
in {
  imports = [
    ./binds.nix
    ./panel.nix
  ];

  xdg.portal = {
    enable = true;
    config.common.default = ["gtk"];
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      hypr_pkg.xdg-desktop-portal-hyprland
    ];
    xdgOpenUsePortal = true;
  };

  home.sessionVariables.GRIMBLAST_HIDE_CURSOR = 1;

  stylix.targets.hyprland.enable = false;
  stylix.targets.hyprpaper.enable = false;

  wayland.windowManager.hyprland = {
    enable = true;

    package = hypr_pkg.hyprland;
    portalPackage = hypr_pkg.xdg-desktop-portal-hyprland;

    settings = {
      ecosystem.no_update_news = true;
      monitor = [
        "eDP-1, 2048x1280@120, 0x0, 1.0"
        "HDMI-A-1, 1920x1080@120, 2048x0, 1.0"
      ];

      misc.disable_hyprland_logo = true;

      input.touchpad.natural_scroll = true;

      general = {
        layout = "master";

        "col.active_border" = "rgb(c4a7e7)";
        "col.inactive_border" = "rgb(6e6a86)";

        border_size = 3;
      };

      decoration.rounding = 0;
    };
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      preload = ["${../../assets/outing.jpg}"];
      wallpaper = [",${../../assets/outing.jpg}"];
      splash = false;
    };
  };
}

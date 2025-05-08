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

    ../common/wayland.nix
  ];

  xdg.portal.extraPortals = [hypr_pkg.xdg-desktop-portal-hyprland];

  home.sessionVariables.GRIMBLAST_HIDE_CURSOR = 1;

  wayland.windowManager.hyprland = {
    enable = true;

    package = hypr_pkg.hyprland;
    portalPackage = hypr_pkg.xdg-desktop-portal-hyprland;

    settings = {
      ecosystem.no_update_news = true;
      monitor =
        map
        (
          m: let
            resolution = "${toString m.width}x${toString m.height}@${toString m.refreshRate}";
            position = "${toString m.x}x${toString m.y}";
          in "${m.name},${
            if m.enabled
            then "${resolution},${position},1"
            else "disable"
          }"
        )
        (config.monitors);

      input.touchpad.natural_scroll = true;

      general = {
        layout = "master";
        border_size = 2;
      };

      decoration.rounding = 0;
    };
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      preload = ["${config.stylix.image}"];
      wallpaper = ["${config.stylix.image}"];
      splash = false;
    };
  };
}

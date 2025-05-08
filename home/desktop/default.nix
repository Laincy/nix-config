{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./util.nix
    ./binds.nix
  ];

  home.sessionVariables = {
    NIXOS_OZONE_WL = 1;
  };

  wayland.windowManager.hyprland = {
    enable = true;

    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;

    settings = {
      monitor = [
        "eDP-1, 2048x1280@120, 0x0, 1.0"
        "HDMI-A-1, 1920x1080@120, 2048x0, 0.8"
      ];

      input.touchpad.natural_scroll = true;

      "$mod" = "SUPER";
      "$terminal" = "alacritty";
      "$menu" = "wofi -S drun";
      "$browser" = "firefox";

      general = {
        layout = "master";
        border_size = 2;
      };

      decoration = {
        rounding = 0;
      };

      exec-once = ["${inputs.hyprpanel.packages.${pkgs.system}.default}/bin/hyprpanel"];
    };
  };
}

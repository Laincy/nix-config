{
  config,
  inputs,
  pkgs,
  ...
}: {
  imports = [
		./binds.nix
		inputs.hyprpanel.homeManagerModules.hyprpanel
	];

  home.sessionVariables.NIXOS_OZONE_WL = 1;

  wayland.windowManager.hyprland = {
    enable = true;

    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;

    settings = {
      monitor = [
        "eDP-1, 2048x1280@120, 0x0, 1.0"
        "HDMI-A-1, 1920x1080@120, 2048x0, 1.0"
      ];

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
      splasjh = false;
    };
  };

  programs.hyprpanel = {
    enable = true;
    systemd.enable = false;
    overlay.enable = true;
    hyprland.enable = true;

    theme = "rose_pine";

    layout."bar.layouts"."0" = {
      left = ["dashboard" "workspaces"];
      middle = ["media"];
      right = ["volume" "network" "bluetooth" "battery" "systray" "clock" "notifications"];
    };

    settings = {
      bar = {
        workspaces.show_numbered = true;
        launcher.autoDetectIcon = true;
        clock.format = "%a %b %d %I:%M %p";
      };
      menus.dashboard = {
        controls.enabled = false;
        directories.enabled = false;
        shortcuts = {
          left = {
            shortcut1 = {
              icon = "";
              command = "firefox";
              tooltip = "Firefox";
            };
            shortcut2.command = "spotify";
            shortcut4.command = config.home.sessionVariables.MENU_CMD;
          };
        };
        powermenu.avatar.image = "${../../assets/bristol.jpg}";
      };
    };
  };
}

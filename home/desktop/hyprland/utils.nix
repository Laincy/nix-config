{
  config,
  inputs,
  ...
}: {
  imports = [inputs.hyprpanel.homeManagerModules.hyprpanel];

  services.hyprpaper = {
    enable = true;
    settings = {
      preload = ["${config.stylix.image}"];
      wallpaper = [",${config.stylix.image}"];
      splash = "false";
    };
  };

  programs.hyprpanel = {
    enable = true;
    systemd.enable = false;
    overlay.enable = true;

    hyprland.enable = true;

    theme = "rose_pine";

    layout = {
      "bar.layouts" = {
        "0" = {
          left = ["dashboard" "workspaces"];
          middle = ["media"];
          right = [
            "volume"
            "network"
            "bluetooth"
            "battery"
            "systray"
            "clock"
            "notifications"
          ];
        };
      };
    };

    settings = {
      bar = {
        workspaces.show_numbered = true;
        launcher.autoDetectIcon = true;
        clock.format = "%a %b %d  %I:%M %p";
      };
      menus.dashboard = {
        controls.enabled = false;
        directories.enabled = false;
        shortcuts = {
          left = {
            shortcut1 = {
              icon = "";
              command = "firefox";
              tooltip = "Firefox";
            };
            shortcut2.command = "spotify";
            shortcut4.command = "wofi -S drun";
          };
        };
        powermenu.avatar.image = "${../../../assets/bristol.jpg}";
      };
    };
  };
}

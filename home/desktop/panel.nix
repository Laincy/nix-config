{
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [wl-clipboard];

  programs.hyprpanel = {
    enable = true;

    settings =
      {
        terminal = "alacritty";
        theme.name = "gruvbox";

        notifications.position = "bottom right";
        layout.bar.layouts."*" = {
          left = ["dashboard" "workspaces"];
          middle = ["media"];
          right = ["volume" "network" "bluetooth" "battery" "systray" "clock" "notifications"];
        };

        bar = {
          workspaces.show_numbered = true;
          launcher.autoDetectIcon = true;
          clock.format = "%a %b %d %I:%M %p";
          media.show_active_only = true;
          network.truncation = false;
        };
        menus = {
          clock = {weather.enabled = false;};
          dashboard = {
            controls.enabled = true;
            directories.enabled = false;
            shortcuts = {
              left = {
                shortcut1 = {
                  icon = "";
                  command = "firefox";
                  tooltip = "Firefox";
                };
                shortcut2.command = "alacritty -e spotify_player";
                shortcut4.command = "tofi-drun";
              };
            };
            powermenu.avatar = {
              name = "Laincy";
              image = "${../../assets/bristol.jpg}";
            };
          };
        };
      }
      // lib.importJSON "${pkgs.hyprpanel}/share/themes/rose_pine.json";
  };
}

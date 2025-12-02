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
        theme.font = {
          name = "AurulentSansM Nerd Font";
          label = "AurulentSansM Nerd Font Bold";
          weight = 800;
        };
        bar = {
          layouts."*" = {
            left = [
              "dashboard"
              "workspaces"
              "windowtitle"
              "systray"
            ];
            middle = ["media"];
            right = [
              "volume"
              "network"
              "battery"
              "clock"
              "notifications"
            ];
          };
          launcher.autoDetectIcon = true;

          workspaces = {
            show_numbered = true;
            numbered_active_indicator = "underline";
          };

          network.truncation_size = 10;

          clock.format = "%a %b %d %I:%M %p";

          media = {
            format = "{title}";
            show_active_only = true;
          };
        };
        menus = {
          clock.weather.enabled = false;

          dashboard = {
            powermenu = {
              avatar.name = "Laincy";
              avatar.image = ../../assets/bristol.jpg;
            };
            directories.enabled = false;

            shortcuts.left.shortcut2.command = "alacritty -e spotify_player";
            shortcuts.left.shortcut4.command = "tofi-drun";
          };
        };
        notifications = {
          position = "bottom left";
          active_monitor = false;
        };
      }
      // lib.importJSON "${pkgs.hyprpanel}/share/themes/rose_pine_split.json";
  };
}

{
  config,
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.hyprpanel.homeManagerModules.hyprpanel
  ];

  home.packages = with pkgs; [wl-clipboard];

  programs.hyprpanel = {
    enable = true;
    overlay.enable = true;
    hyprland.enable = true;

    settings = {
      terminal = "alacritty";
      theme.name = "rose_pine";

      notifications.position = "bottom right";
      layout."bar.layouts"."0" = {
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
              shortcut2.command = "spotify";
              shortcut4.command = "${config.programs.tofi.package}/bin/tofi-drun";
            };
          };
          powermenu.avatar = {
            name = "Laincy";
            image = "${../../assets/bristol.jpg}";
          };
        };
      };
    };
  };
}

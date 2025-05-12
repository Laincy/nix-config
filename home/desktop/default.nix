{
  config,
  pkgs,
  ...
}: {
  imports = [./bar.nix];

  home.packages = with pkgs; [niri-stable];
  programs.niri = {
    package = pkgs.niri-stable;
    settings = {
      prefer-no-csd = true;

      input = {
        touchpad.natural-scroll = true;
        focus-follows-mouse.enable = true;
      };

      outputs."eDP-1" = {
        mode = {
          width = 2048;
          height = 1280;
          refresh = 120.0;
        };
        scale = 1;
      };

      environment.DISPLAY = ":0";

      cursor = {
        theme = config.gtk.cursorTheme.name;
        size = 24;
      };

      layout = {
        default-column-width.proportion = 0.5;

        focus-ring = {
          active.color = "#c4a7e7";
          inactive.color = "#6e6a86";
        };
      };

      spawn-at-startup = [
        {
          command = ["wpaperd" "-d"];
        }
        {
          command = ["waybar"];
        }
        {
          command = ["${pkgs.xwayland-satellite}/bin/xwayland-satellite"];
        }
      ];

      hotkey-overlay.skip-at-startup = true;

      binds = let
        brightness = "${pkgs.brightnessctl}/bin/brightnessctl";
      in
        with config.lib.niri.actions; {
          "Mod+Q".action.spawn = "alacritty";
          "Mod+R".action.spawn = "fuzzel";
          "Mod+C".action = close-window;
          "Mod+Shift+E".action.quit.skip-confirmation = true;

          "Mod+F".action = maximize-column;
          "Mod+Shift+F".action = fullscreen-window;

          "Mod+H".action = focus-column-left;
          "Mod+J".action = focus-window-down;
          "Mod+K".action = focus-window-up;
          "Mod+L".action = focus-column-right;

          "Mod+Shift+H".action = move-column-left;
          "Mod+Shift+J".action = move-window-down;
          "Mod+Shift+K".action = move-window-up;
          "Mod+Shift+L".action = move-column-right;

          "Mod+BracketLeft".action = consume-or-expel-window-left;
          "Mod+BracketRight".action = consume-or-expel-window-right;

          "Mod+1".action = focus-workspace 1;
          "Mod+2".action = focus-workspace 2;
          "Mod+3".action = focus-workspace 3;
          "Mod+4".action = focus-workspace 4;
          "Mod+5".action = focus-workspace 5;
          "Mod+6".action = focus-workspace 6;
          "Mod+7".action = focus-workspace 7;
          "Mod+8".action = focus-workspace 8;
          "Mod+9".action = focus-workspace 9;

          "Mod+Shift+1".action.move-window-to-workspace = 1;
          "Mod+Shift+2".action.move-window-to-workspace = 2;
          "Mod+Shift+3".action.move-window-to-workspace = 3;
          "Mod+Shift+4".action.move-window-to-workspace = 4;
          "Mod+Shift+5".action.move-window-to-workspace = 5;
          "Mod+Shift+6".action.move-window-to-workspace = 6;
          "Mod+Shift+7".action.move-window-to-workspace = 7;
          "Mod+Shift+8".action.move-window-to-workspace = 8;
          "Mod+Shift+9".action.move-window-to-workspace = 9;

          "Mod+Ctrl+1".action.move-column-to-workspace = 1;
          "Mod+Ctrl+2".action.move-column-to-workspace = 2;
          "Mod+Ctrl+3".action.move-column-to-workspace = 3;
          "Mod+Ctrl+4".action.move-column-to-workspace = 4;
          "Mod+Ctrl+5".action.move-column-to-workspace = 5;
          "Mod+Ctrl+6".action.move-column-to-workspace = 6;
          "Mod+Ctrl+7".action.move-column-to-workspace = 7;
          "Mod+Ctrl+8".action.move-column-to-workspace = 8;
          "Mod+Ctrl+9".action.move-column-to-workspace = 9;

          "Mod+Shift+Slash".action = show-hotkey-overlay;

          "XF86AudioRaiseVolume" = {
            allow-when-locked = true;
            action.spawn = ["wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1+" "-l" "1.0"];
          };

          "XF86AudioLowerVolume" = {
            allow-when-locked = true;
            action.spawn = ["wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1-"];
          };

          "XF86AudioMute" = {
            allow-when-locked = true;
            action.spawn = ["wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle"];
          };

          "XF86MonBrightnessUp".action.spawn = [brightness "set" "5%+"];
          "XF86MonBrightnessDown".action.spawn = [brightness "set" "5%-"];
        };
    };
  };
  services.wpaperd = {
    enable = true;
    settings.default.path = "${../../assets/outing.jpg}";
  };
}

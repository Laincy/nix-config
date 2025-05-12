{...}: {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        spacing = 10;
        output = ["eDP-1"];

        modules-left = ["custom/nixos" "niri/workspaces" "niri/window"];
        #modules-center = ["mpd"];`
        modules-right = ["pulseaudio" "backlight" "battery"];

        "niri/workspaces" = {
          disable-scroll = true;
          disable-click = true;
          all-outputs = true;
        };

        "niri/window" = {
          format = "{}";
          max-length = 40;
          rewrite = {
            "(.*) — Mozilla Firefox" = "󰈹 $1";
            "Alacritty" = " Alacritty";
          };
        };

        "backlight" = {
          format = "󱁝{percent}%";
        };

        "battery" = {
          format = "{icon}{capacity}%";
          format-muted = "󰝟 mut";
          format-icons = ["󰁺" "󰁼" "󰁽" "󰂀" "󰁹"];

          states = {
            warning = 30;
            critical = 15;
          };
        };

        "pulseaudio" = {
          format = "{volume}% {icon}";
          format-bluetooth = "{volume}% {icon}";
          format-muted = "mut 󰝟";
          format-icons = ["" ""];
          scroll-step = 1;
        };

        "custom/nixos" = {
          format = "󱄅";
        };
      };
    };

    style = builtins.readFile ./style.css;
  };
}

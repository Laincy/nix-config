{pkgs, ...}: let
  brightness = "${pkgs.brightnessctl}/bin/brightnessctl";
  av_device = "@DEFAULT_AUDIO_SINK@";
in {
  wayland.windowManager.hyprland.settings = {
    bind = [
      "$mod, q, exec, $terminal"
      "$mod, r, exec, $menu"
      "$mod, b, exec, $browser"

      "$mod, c, killactive"
      #"$mod, l, exit"

      "$mod, f, fullscreen"
      "$mod, m, layoutmsg, swapwithmaster"
      "$mod, v, togglefloating"

      "$mod, 1, workspace, 1"
      "$mod, 2, workspace, 2"
      "$mod, 3, workspace, 3"
      "$mod, 4, workspace, 4"
      "$mod, 5, workspace, 5"
      "$mod, 6, workspace, 6"
      "$mod, 7, workspace, 7"
      "$mod, 8, workspace, 8"
      "$mod, 9, workspace, 9"
      "$mod, 0, workspace, 10"

      "$mod, h, movefocus, l"
      "$mod, j, movefocus, d"
      "$mod, k, movefocus, u"
      "$mod, l, movefocus, r"

      "$mod shift, h, movewindow, l"
      "$mod shift, j, movewindow, d"
      "$mod shift, k, movewindow, u"
      "$mod shift, l, movewindow, r"

      "$mod control, h, resizeactive, -10 0"
      "$mod control, j, resizeactive, 0 10"
      "$mod control, k, resizeactive, 0 -10"
      "$mod control, l, resizeactive, 10 0"

      "$mod shift, 1, movetoworkspace, 1"
      "$mod shift, 2, movetoworkspace, 2"
      "$mod shift, 3, movetoworkspace, 3"
      "$mod shift, 4, movetoworkspace, 4"
      "$mod shift, 5, movetoworkspace, 5"
      "$mod shift, 6, movetoworkspace, 6"
      "$mod shift, 7, movetoworkspace, 7"
      "$mod shift, 8, movetoworkspace, 8"
      "$mod shift, 9, movetoworkspace, 9"
      "$mod shift, 0, movetoworkspace, 10"

      "$mod control, 1, moveworkspacetomonitor, 1 current"
      "$mod control, 2, moveworkspacetomonitor, 2 current"
      "$mod control, 3, moveworkspacetomonitor, 3 current"
      "$mod control, 4, moveworkspacetomonitor, 4 current"
      "$mod control, 5, moveworkspacetomonitor, 5 current"
      "$mod control, 6, moveworkspacetomonitor, 6 current"
      "$mod control, 7, moveworkspacetomonitor, 7 current"
      "$mod control, 8, moveworkspacetomonitor, 8 current"
      "$mod control, 9, moveworkspacetomonitor, 9 current"
      "$mod control, 0, moveworkspacetomonitor, 10 current"
    ];

    bindle = [
      # Audio
      ",XF86AudioMute, exec, wpctl set-mute ${av_device} toggle"
      ",XF86AudioRaiseVolume, exec, wpctl set-volume ${av_device} 5%+ -l 1.0"
      ",XF86AudioLowerVolume, exec, wpctl set-volume ${av_device} 5%-"

      # Brightness
      ",XF86MonBrightnessUp, exec, ${brightness} set 5%+"
      ",XF86MonBrightnessDown, exec, ${brightness} set 5%-"
    ];

		bindm = [
			"$mod, mouse:272, movewindow"
			"$mod, mouse:273, resizewindow"
		];
  };
}

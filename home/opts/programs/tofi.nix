{...}: {
  programs.tofi = {
    enable = true;
    settings = {
      drun-launch = true;
      ascii-input = true;
      width = "30%";
      height = "20%";
    };
  };
  wayland.windowManager.hyprland.settings.layerrule = [
    "noanim, ^(launcher)$"
  ];
}

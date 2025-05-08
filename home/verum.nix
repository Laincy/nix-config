{...}: {
  imports = [
    ./global
    ./themes/rose-pine

    ./opts/desktop/hyprland
  ];

  monitors = [
    {
      name = "eDP-1";
      width = 2048;
      height = 1280;
      refreshRate = 120;
      x = 0;
      y = 0;
      enabled = true;
    }
    {
      name = "HDMI-A-1";
      width = 1920;
      height = 1080;
      x = 2048;
      y = 0;
      enabled = true;
    }
  ];
}

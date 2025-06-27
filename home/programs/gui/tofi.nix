{pkgs, ...}: {
  programs.tofi = {
    enable = true;
    settings = {
      drun-launch = true;
      ascii-input = true;
      width = "30%";
      height = "20%";

      font = "${pkgs.nerd-fonts.aurulent-sans-mono}/share/fonts/opentype/NerdFonts/AurulentSansM/AurulentSansMNerdFontMono-Regular.otf";
      font-size = 12;
      text-color = "#e0def4";
      selection-color = "#908caa";

      background-color = "#191724";

      border-color = "#c4a7e7";
      border-width = 4;
    };
  };

  wayland.windowManager.hyprland.settings.layerrule = [
    "noanim, ^(launcher)$"
  ];
}

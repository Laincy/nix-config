{
  pkgs,
  inputs,
  ...
}: {
  services.gvfs.enable = true;
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;

  # Make GTK work
  programs.dconf.enable = true;

  xdg.portal = {
    enable = true;
    config = {
      common.default = [
        "gtk"
      ];
    };
    extraPortals = [
      inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland
    ];
    xdgOpenUsePortal = true;
  };

  services.flatpak.enable = true;
}

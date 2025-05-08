{pkgs, ...}: {
  services.gvfs.enable = true;
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;

  # Make GTK work
  # programs.dconf.enable = false;

  xdg.portal = {
    enable = true;
    config.common.default = [
      "gtk"
    ];
    extraPortals = with pkgs; [xdg-desktop-portal-gtk];
    xdgOpenUsePortal = true;
  };
  services.flatpak.enable = true;
}

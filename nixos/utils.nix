{pkgs, inputs, ...}: {
  # Hyprpanel Dependencies
  services.gvfs.enable = true;
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;

  # Make GTK work
  programs.dconf.enable = true;

  #Sober roblox
  services.flatpak.enable = true;
  xdg.portal = {
    enable = true;
    config = {
      common.default = [
        "gtk"
      ];
    };
    extraPortals = [
    	pkgs.xdg-desktop-portal-gtk
		];
		xdgOpenUsePortal = true;
  };

	services.ratbagd.enable = true;
}

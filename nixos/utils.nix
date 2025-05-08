{...}: {
  # Hyprpanel Dependencies
  services.gvfs.enable = true;
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;

  # Make GTK work
  programs.dconf.enable = true;
}

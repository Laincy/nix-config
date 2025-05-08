{
  inputs,
  pkgs,
  ...
}: {
  security.rtkit.enable = true;

  programs.dconf.enable = true;

  services = {
    gvfs.enable = true;
    power-profiles-daemon.enable = true;
    upower.enable = true;

    greetd = {
      enable = true;
      settings.default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --cmd ${inputs.hyprland.packages.${pkgs.system}.hyprland}/bin/Hyprland";
        user = "greeter";
      };
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };
}

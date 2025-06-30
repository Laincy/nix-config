{...}: {
  imports = [
    ./disko.nix
    ./graphics.nix
    ./hardware-config.nix
    ./persist.nix
  ];

  hardware.keyboard.qmk.enable = true;
  security.rtkit.enable = true;

  services = {
    upower.enable = true;
    power-profiles-daemon.enable = true;

    pipewire = {
      enable = true;
      pulse.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
    };
  };
}

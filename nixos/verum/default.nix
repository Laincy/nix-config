{
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ../common/global

		#   ../common/opts/lanzaboote.nix
    ../common/opts/network-manager.nix
    ../common/users/laincy.nix

    ./hardware-configuration.nix
  ];

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "nvidia-x11"
      "nvidia-settings"
    ];

  networking.hostName = "verum";

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

  sops.secrets.user-ssh-key = {
    sopsFile = ./secrets.yaml;
    owner = "laincy";
  };
}

{
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./explode

    ./hardware-configuration.nix
    ./localization.nix
    ./user.nix
    ./utils.nix
  ];

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "nvidia-x11"
      "nvidia-settings"
    ];

  system.stateVersion = "24.05";
  nix.settings.experimental-features = ["nix-command" "flakes"];

  environment.systemPackages = with pkgs; [
    sbctl
    git
    vim
  ];

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };

  boot = {
    lanzaboote = {
      enable = true;
      pkiBundle = "/var/lib/sbctl";
    };

    loader.systemd-boot.enable = lib.mkForce false;
  };

  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };
}

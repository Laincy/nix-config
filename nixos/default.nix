{
  inputs,
  lib,
  pkgs,
  ...
}: let
  hyprland_pkgs = inputs.hyprland.packages.${pkgs.system};
in {
  imports = [
    ./disk-config.nix
    ./hardware-configuration.nix
    ./localization.nix
    ./persist.nix
    ./user.nix

    # May need to be removed on first install
    ./secureboot.nix
  ];

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };

  environment.systemPackages = with pkgs; [
    git
    vim
    sbctl
    sops
    helvum
    via
    btop

    hyprland_pkgs.hyprland
  ];

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "nvidia-x11"
      "nvidia-settings"
      "via"
      "steam"
      "steam-original"
      "steam-unwrapped"
      "steam-run"
    ];

  sops = {
    defaultSopsFormat = "yaml";
    defaultSopsFile = ./secrets.yaml;
    secrets = {
      user-password.neededForUsers = true;
      user-ssh-key.owner = "laincy";
      git-ssh-key.owner = "laincy";
    };
  };

  boot.loader = {
    efi.canTouchEfiVariables = lib.mkDefault true;
    systemd-boot.enable = lib.mkDefault true;
  };

  security.rtkit.enable = true;

  services = {
    openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = false;
        PermitRootLogin = "no";
      };

      hostKeys = [
        {
          path = "/persist/etc/ssh/ssh_host_ed25519_key";
          type = "ed25519";
        }
      ];
    };

    upower.enable = true;

    pipewire = {
      enable = true;
      pulse.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
    };

    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --cmd Hyprland";
        };
      };
    };

    flatpak.enable = true;

    power-profiles-daemon.enable = true;
  };

  hardware.keyboard.qmk.enable = true;

  programs.steam = {
    enable = true;
  };

  xdg.portal = {
    enable = true;

    xdgOpenUsePortal = true;

    config.common.default = ["gtk"];

    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      hyprland_pkgs.xdg-desktop-portal-hyprland
    ];
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];
  system.stateVersion = "24.05";
}

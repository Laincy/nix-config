{
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./disk-config.nix
    ./lanzaboote.nix
    ./localization.nix
    ./persist.nix
    ./theme.nix
    ./user.nix
  ];

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };

  environment = {
    systemPackages = with pkgs; [
      sops
      git
      vim
      sbctl
    ];
  };

  sops = {
    defaultSopsFormat = "yaml";
    defaultSopsFile = ./secrets.yaml;
    secrets = {
      user-password.neededForUsers = true;
      user-ssh-key.owner = "laincy";
      git-ssh-key.owner = "laincy";
    };
  };

  users.mutableUsers = false;

  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    substituters = [
      "https://nix-community.cachix.org"
      "https://hyprland.cachix.org"
    ];
    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
  };

  security.rtkit.enable = true;

  services = {
    gvfs.enable = true;
    power-profiles-daemon.enable = true;
    upower.enable = true;

    greetd = {
      enable = true;
      settings.default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --cmd ${inputs.hyprland.packages.${pkgs.system}.hyprland}/bin/Hyprland";
      };
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
      jack.enable = true;
    };

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
  };

  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-curses;
    enableSSHSupport = true;
  };

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "nvidia-x11"
      "nvidia-settings"
    ];

  # DO NOT TOUCH
  system.stateVersion = "24.05";
}

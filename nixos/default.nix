{
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./disk-config.nix
    ./hardware-configuration.nix
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
    via
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

  time.timeZone = "America/New_York";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "";
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
  };

  services.pipewire = {
    enable = true;
    jack.enable = true;
  };

  services.greetd = {
    enable = true;
    settings.default_session = {
      command = "${pkgs.greetd.tuigreet}/bin/tuigreet --cmd ${inputs.hyprland.packages."${pkgs.system}".hyprland}/bin/hyprland";
    };
  };

  services.upower = {
    enable = true;
  };

  programs.steam.enable = true;

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "nvidia-x11"
      "nvidia-settings"
      "discord"
      "google-chrome"
      "obsidian"
      "spotify"
      "via"

      "steam"
      "steam-original"
      "steam-unwrapped"
      "steam-run"
    ];

  services.flatpak.enable = true;

  xdg.portal = {
    enable = true;

    xdgOpenUsePortal = true;

    config.common.default = [
      "gtk"
      "gnome"
    ];

    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
    ];
  };

  hardware.keyboard.qmk.enable = true;

  services.udev.packages = [pkgs.via];

  nix.settings.experimental-features = ["nix-command" "flakes"];
  system.stateVersion = "24.05";
}

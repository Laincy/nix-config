{
  inputs,
  lib,
  pkgs,
  ...
}: let
  hyprland_pkgs = inputs.hyprland.packages.${pkgs.system};
in {
  imports = [
    ./hardware

    # May have to remove on first install
    ./secure-boot.nix

    ./sops.nix
    ./unfree.nix
    ./user.nix
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
    btop
    via
    podman-tui
    podman-compose

    hyprland_pkgs.hyprland
  ];

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --cmd Hyprland";
      };
    };
  };

  boot.loader = {
    efi.canTouchEfiVariables = lib.mkDefault true;
    systemd-boot.enable = lib.mkDefault true;
  };

  services.flatpak.enable = true;

  xdg.portal = {
    enable = true;

    xdgOpenUsePortal = true;

    config.common.default = ["gtk"];

    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      hyprland_pkgs.xdg-desktop-portal-hyprland
    ];
  };

  programs.steam.enable = true;

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

  nix.settings.experimental-features = ["nix-command" "flakes"];
  system.stateVersion = "24.05";

  programs.virt-manager.enable = true;

  virtualisation = {
    containers = {
      enable = true;
      # registries.search = [
      #   "docker.io"
      #   "quay.io"
      # ];
    };

    oci-containers.backend = "podman";
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };
    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };
}

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

    hyprland_pkgs.hyprland
  ];

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --cmd Hyprland";
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

  # TODO: Remove
  services.postgresql = {
    enable = true;
    ensureDatabases = ["kromer"];
    authentication = pkgs.lib.mkOverride 10 ''
      #type database  DBuser  auth-method
      local all       all     trust

      #ipv4
      host  all      all     127.0.0.1/32   trust

      # ipv6
      host all       all     ::1/128        trust
    '';

    initialScript = pkgs.writeText "backend-initScript" ''
      CREATE ROLE service WITH LOGIN PASSWORD 'password' CREATEDB;
      CREATE DATABASE kromer;
      GRANT ALL PRIVILEGES ON DATABASE kromer TO service;
    '';
  };
}

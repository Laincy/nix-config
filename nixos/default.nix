{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./explode
    ./sops
    ./theme.nix
    ./user.nix
    ./utils.nix
  ];

  system.stateVersion = "24.05";
  nix.settings.experimental-features = ["nix-command" "flakes"];

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  environment.systemPackages = with pkgs; [
    greetd.tuigreet
    helvum
    lshw
    btop
    git
  ];

  nixpkgs.config.allowUnfree = true;

  # Display Manager
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        user = "laincy";
        command = "tuigreet --cmd Hyprland -r";
      };
    };
  };

  # Localization
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
}

{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./localization.nix
    ./user.nix
    ./theme.nix

    ./explode
  ];

  system.stateVersion = "24.05";
  nix.settings.experimental-features = ["nix-command" "flakes"];

	boot.loader = {
		systemd-boot.enable = true;
		efi.canTouchEfiVariables = true;
	};

  environment.systemPackages = with pkgs; [
    git
    vim
    helvum
		greetd.tuigreet
  ];

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        user = "laincy";
        command = "tuigreet --cmd Hyprland -r";
      };
    };
  };

	# Audio
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    jack.enable = true;
  };
}

{
  inputs,
  pkgs,
  self,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./persist.nix
    ./localization.nix
    ./disk-config.nix
    ./openssh.nix
		./sops.nix
  ];
  users.mutableUsers = false;

  home-manager.extraSpecialArgs = {inherit inputs self;};

  environment.systemPackages = with pkgs; [
    git
    vim
  ];

  system.stateVersion = "24.05";
  nix.settings.experimental-features = ["nix-command" "flakes"];

  nix.settings = {
    substituters = [
      "https://nix-community.cachix.org"
      "https://hyprland.cachix.org"
    ];
    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
  };

  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-curses;
    enableSSHSupport = true;
  };
}

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
  ];
  users.mutableUsers = false;

  home-manager.extraSpecialArgs = {inherit inputs self;};

  environment.systemPackages = with pkgs; [
    git
    vim
  ];

  system.stateVersion = "24.05";
  nix.settings.experimental-features = ["nix-command" "flakes"];
}

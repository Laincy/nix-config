{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  users.users.laincy = {
    isNormalUser = true;
    hashedPasswordFile = config.sops.secrets.primary.path;
    description = "main user account";
    extraGroups = ["networkmanager" "wheel" "pipewire"];
    shell = pkgs.nushell;
  };

  home-manager = {
    sharedModules = [
      inputs.sops-nix.homeManagerModules.sops
    ];
    extraSpecialArgs = {inherit inputs;};
    users.laincy = import ../home;
  };

  programs.fuse.userAllowOther = true;

  environment.persistence."/persist".users.laincy = {
    directories = [];
  };
}

{
  config,
  inputs,
  pkgs,
  self,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  users.users.laincy = {
    isNormalUser = true;
    shell = pkgs.nushell;
    extraGroups = [
      "networkmanager"
      "wheel"
      "pipewire"
    ];
    openssh.authorizedKeys.keyFiles = [../home/ssh.pub];

    hashedPasswordFile = config.sops.secrets.user-password.path;
  };

  home-manager = {
    extraSpecialArgs = {inherit inputs self;};
    users.laincy = import ../home;
  };
}

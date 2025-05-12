{
  config,
  inputs,
  pkgs,
  self,
  ...
}: {
  imports = [inputs.home-manager.nixosModules.home-manager];

  users = {
    mutableUsers = false;

    users.laincy = {
      isNormalUser = true;
      shell = pkgs.nushell;
      openssh.authorizedKeys.keyFiles = [../home/ssh.pub];

      extraGroups = [
        "networkmanager"
        "wheel"
        "pipewire"
      ];

      hashedPasswordFile = config.sops.secrets.user-password.path;
    };
  };

  programs.dconf.enable = true;
  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-curses;
    enableSSHSupport = true;
  };

  home-manager = {
		useGlobalPkgs = true;
    extraSpecialArgs = {inherit inputs self;};
    users.laincy = import ../home;
  };
}

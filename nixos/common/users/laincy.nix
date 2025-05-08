{
  pkgs,
  config,
  ...
}: let
  # Shamelessly stolen function, see Misterio77's config
  ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in {
  users.users.laincy = {
    isNormalUser = true;
    shell = pkgs.nushell;
    extraGroups = ifTheyExist [
      "networkmanager"
      "wheel"
      "pipewire"
    ];
    openssh.authorizedKeys.keyFiles = [../../../home/ssh.pub];

    hashedPasswordFile = config.sops.secrets.user-password.path;
  };

  home-manager.users.laincy = import ../../../home/${config.networking.hostName}.nix;

  sops.secrets.user-password = {
    sopsFile = ../secrets.yaml;
    neededForUsers = true;
  };
}

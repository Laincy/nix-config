{config, ...}: {
  # Had problem with HM overwriting known hosts every once in a while. Used Misterio77's solution

  home.persistence."/persist/home/${config.home.username}".directories = [
    ".ssh/known_hosts.d"
  ];

  programs.ssh = {
    enable = true;
    matchBlocks.${config.home.username}.userKnownHostsFile = "${config.home.homeDirectory}/.ssh/known_hosts.d/hosts";
    extraConfig = "identityFile /run/secrets/user-ssh-key";
  };
}

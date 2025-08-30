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
      openssh.authorizedKeys.keyFiles = [../home/ssh.pub];

      extraGroups = [
        "networkmanager"
        "wheel"
        "pipewire"
        "podman"
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
    extraSpecialArgs = {inherit inputs self;};
    users.laincy = import ../home;
  };

  programs.bash = {
    interactiveShellInit = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
  };
}

{
  config,
  inputs,
  self,
  pkgs,
  ...
}: let
  nixvim = self.packages.${pkgs.system}.nvim;
in {
  imports = [
    inputs.impermanence.nixosModules.home-manager.impermanence
    ./prefs.nix

    ../opts/programs/nushell.nix
    ../opts/programs/tmux.nix
  ];

  home = {
    username = "laincy";
    homeDirectory = "/home/${config.home.username}";
    stateVersion = "24.05";

    persistence."/persist${config.home.homeDirectory}" = {
      directories = [
        "Documents"
        "Downloads"
        "Pictures"
        "Programming"
      ];
      files = [
        ".config/gh/hosts.yml"
      ];
      allowOther = true;
    };
    packages = [
      nixvim
    ];
    sessionVariables.EDITOR = "${nixvim}/bin/nvim";
  };

  programs = {
    git = {
      enable = true;
      extraConfig.init.defaultBranck = "main";
      userName = "laincy";
      userEmail = "laincy@proton.me";
    };
    gh = {
      enable = true;
      settings = {
        version = "1";
        git_protocol = "https";
        prompt = "enabled";
      };
    };
  };
}

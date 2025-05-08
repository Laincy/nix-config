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

    ./desktop
    ./programs
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
        ".gnupg"
      ];
      files = [
        ".config/gh/hosts.yml"
        ".ssh/known_hosts"
      ];
      allowOther = true;
    };

    packages = with pkgs; [
      nixvim
      glow
    ];
    sessionVariables.EDITOR = "${nixvim}/bin/nvim";
  };
}

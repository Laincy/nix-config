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
      allowOther = true;
    };

    packages = [nixvim];

    sessionVariables.EDITOR = "${nixvim}/bin/nvim";
  };

  gtk = {
    enable = true;

    theme = {
      name = "rose-pine";
      package = pkgs.rose-pine-gtk-theme;
    };

    cursorTheme = {
      name = "BreezeX-RosePine-Linux";
      package = pkgs.rose-pine-cursor;
    };

    iconTheme = {
      name = "rose-pine";
      package = pkgs.rose-pine-icon-theme;
    };
  };

  stylix.autoEnable = false;
}

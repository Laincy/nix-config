{
  config,
  inputs,
  pkgs,
  self,
  ...
}: let
  nixvim = self.packages.${pkgs.system}.nvim;
in {
  imports = [
    inputs.impermanence.homeManagerModules.default

		./desktop
    ./programs
    ./theme.nix
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
}

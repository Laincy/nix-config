{
  config,
  inputs,
  pkgs,
  self,
  ...
}: {
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

        ".cache/shotwell"
        ".local/share/shotwell"
      ];
      allowOther = true;
    };

    packages = with pkgs; [(self.packages.${pkgs.system}.nvim) shotwell];

    sessionVariables.EDITOR = "nvim";
  };
}

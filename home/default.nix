{
  config,
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.impermanence.nixosModules.home-manager.impermanence
    ./desktop/hyprland
    ./programs
  ];

  home = {
    username = "laincy";
    homeDirectory = "/home/${config.home.username}";
    stateVersion = "24.05";

    persistence."/persist/home/${config.home.username}" = {
      directories = [
        "Downloads"
        "Documents"
        "Programming"
        "Pictures"
      ];
      allowOther = true;
    };

    sessionVariables = {
      editor = "nvim";
      term = "alacritty";
    };
		
  };

  gtk = {
    enable = true;

    iconTheme.name = "Adwaita";
    iconTheme.package = pkgs.adwaita-icon-theme;
  };
}

{
  config,
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.impermanence.nixosModules.home-manager.impermanence
    ./desktop
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
        "Media"

        # Firefox State
        ".mozilla"
        ".cache/mozilla"

        # Spotify State
        #".config/spotify"
        #".cache/spotify"

        # Vesktop State
        ".config/vesktop"
      ];

      files = [
        ".config/gh/hosts.yml"
        ".config/sops/age/keys.txt"
      ];
      allowOther = true;
    };

    sessionVariables = {
      EDITOR = "nvim";
      TERM = "alacritty";
    };

    packages = [
      #(inputs.nixvim.packages.${pkgs.system}.default)
      (inputs.hyprpanel.packages.${pkgs.system}.default)
      pkgs.ripgrep
    ];
  };

  gtk = {
    enable = true;

    iconTheme.name = "Adwaita";
    iconTheme.package = pkgs.adwaita-icon-theme;
  };
}

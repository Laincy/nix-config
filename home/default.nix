{
  config,
  inputs,
  pkgs,
  lib,
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

        # Firefox state
        ".mozilla"
        ".cache/mozilla"

        # Flatpak
        ".local/share/flatpak"
        ".var/app/org.vinegarhq.Sober"

        # Spotify state
        ".config/spotify"
        ".cache/spotify"

        # Vesktop State
        ".config/discord"

        #Minecraft state
        ".local/share/PrismLauncher"
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
      (inputs.hyprpanel.packages.${pkgs.system}.default)
      pkgs.ripgrep
      pkgs.spotify
      (inputs.prismlauncher.packages.${pkgs.system}.prismlauncher)
    ];
  };

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "spotify"
      "discord"
			"obsidian"
    ];

  gtk = {
    enable = true;

    iconTheme.name = "Adwaita";
    iconTheme.package = pkgs.adwaita-icon-theme;
  };
}

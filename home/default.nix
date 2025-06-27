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
        ".local/share/steam"
        ".steam"
      ];
      allowOther = true;
    };

    packages = with pkgs; [
      (self.packages.${pkgs.system}.nvim)
      shotwell
      helvum
    ];

    sessionVariables = {
      EDITOR = "nvim";
      DISPLAY = ":0";
      BROWSER = "firefox";
    };
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "default-web-browser" = ["firefox.desktop"];
      "text/html" = ["firefox.desktop"];
      "x-scheme-handler/http" = ["firefox.desktop"];
      "x-scheme-handler/https" = ["firefox.desktop"];
      "x-scheme-handler/about" = ["firefox.desktop"];
      "x-scheme-handler/unknown" = ["firefox.desktop"];
    };
  };
}

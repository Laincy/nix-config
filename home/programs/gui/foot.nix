{pkgs, ...}: {
  programs.foot = {
    enable = true;
    server.enable = true;

    settings = {
      main = {
        font = "AurulentSansM Nerd Font Mono:size=12";
        include =
          pkgs.fetchFromGitHub {
            owner = "rose-pine";
            repo = "foot";
            rev = "fd30db031194d5905b9f5ab832ed770931036944";
            hash = "sha256-QGNKJqqP6dtihAU5sp6bRt5vcZzPSzdsBSgtSpbZ9k0=";
          }
          + "/rose-pine";
      };

      mouse = {
        hide-when-typing = "yes";
      };
    };
  };
}

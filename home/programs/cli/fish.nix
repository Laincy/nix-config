{pkgs, ...}: {
  programs = {
    fish = {
      enable = true;

      shellInit = ''
        set -x GPG_TTY (tty)
      '';

      interactiveShellInit = ''
        set fish_greeting # Disable greeting
      '';

      plugins = [
        {
          name = "grc";
          src = pkgs.fishPlugins.grc.src;
        }
      ];
    };

    starship = {
      enable = true;
      enableFishIntegration = true;
    };
  };

  home.packages = with pkgs; [
    grc
  ];
}

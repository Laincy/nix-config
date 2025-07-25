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

      shellAbbrs = {
        gad = "git add";
        nrs = "sudo nixos-rebuild switch --flake .";
        nrb = "sudo nixos-rebuild boot --flake .";
        nds = "nix develop -c fish";
      };

      shellAliases = {
        lsa = "ls -a";
      };
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

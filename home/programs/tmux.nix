{pkgs, ...}: {
  stylix.targets.tmux.enable = false;

  programs.tmux = {
    enable = true;
    baseIndex = 1;
    shortcut = "a";

    terminal = "alacritty";

    plugins = with pkgs.tmuxPlugins; [
      rose-pine
      sensible
      vim-tmux-navigator
    ];

    extraConfig = ''
      set -g default-terminal "$TERM"
      set -ag terminal-overrides ",$TERM:Tc"
    '';
  };
}

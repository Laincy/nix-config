{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    shortcut = "a";

    terminal = "alacritty";

    plugins = with pkgs.tmuxPlugins; [
      sensible
      vim-tmux-navigator
      rose-pine
    ];

    extraConfig = ''
      set -g default-terminal "$TERM"
      set -ag terminal-overrides ",$TERM:Tc"
    '';
  };
}

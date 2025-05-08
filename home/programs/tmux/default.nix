{pkgs, ...}: {
  stylix.targets.tmux.enable = false;

  programs.tmux = {
    enable = true;
    baseIndex = 1;

    terminal = "tmux-256color";

    shortcut = "a";

    plugins = with pkgs.tmuxPlugins; [
      rose-pine
      sensible
      vim-tmux-navigator
    ];

    extraConfig = ''
      set -ag terminal-overrides ",xterm-256color:RGB"
    '';
  };
}

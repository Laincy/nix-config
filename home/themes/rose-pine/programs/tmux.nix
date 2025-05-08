{pkgs, ...}: {
  stylix.targets.tmux.enable = false;
  programs.tmux.plugins = [
    pkgs.tmuxPlugins.rose-pine
  ];
}

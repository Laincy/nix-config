{
  lib,
  config,
  ...
}: {
  programs.alacritty = {
    enable = true;
    settings = {
      env.TERM = lib.mkIf (config.programs.tmux.enable) "xterm-256color";
      window.padding = {
        x = 5;
        y = 5;
      };
    };
  };
}

{lib, ...}: {
  programs.alacritty = {
    enable = true;
    settings = {
      env.TERM = "xterm-256color";
      window = {
        opacity = lib.mkForce 0.7;
        blur = true;
        padding = {
          x = 5;
          y = 5;
        };
      };
    };
  };
}

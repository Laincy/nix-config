{lib, ...}: {
  programs.alacritty = {
    enable = true;
    settings = {
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

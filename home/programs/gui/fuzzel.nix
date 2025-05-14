{config, ...}: {
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        terminal = "${config.programs.alacritty.package}/bin/alacritty";
        layer = "overlay";
      };

      colors = {
        background = "#1f1d2eff";
        text = "#e0def4ff";
        match = "#eb6f92ff";
        prompt = "#9ccfd8ff";
        selection = "#403d52ff";
        selection-text = "#e0def4ff";
        selection-match = "#f6c177ff";
        border = "#c4a7e7ff";
      };

      border.width = 3;
    };
  };
}

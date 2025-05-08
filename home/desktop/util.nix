{config, ...}: {
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = ["${config.stylix.image}"];
      wallpaper = [",${config.stylix.image}"];
      splash = "false";
    };
  };

  home.file.".config/hyprpanel/config.json".source = ./hyprpanel-options.json;
}

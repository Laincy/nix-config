{config, ...}: {
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = ["${config.stylix.image}"];
      wallpaper = [",${config.stylix.image}"];
      splash = "false";
    };
  };

	home.file.".cache/ags/hyprpanel/options.json".source = ./hyprpanel-options.json;
}

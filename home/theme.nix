{pkgs, ...}: {
  gtk = {
    enable = true;

    theme = {
      name = "rose-pine";
      package = pkgs.rose-pine-gtk-theme;
    };

    cursorTheme = {
      name = "BreezeX-RosePine-Linux";
      package = pkgs.rose-pine-cursor;
    };

    iconTheme = {
      name = "adwaita";
      package = pkgs.adwaita-icon-theme;
    };
  };

  home.packages = with pkgs; [
    nerd-fonts.aurulent-sans-mono
  ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts.monospace = ["AurulentSansM Nerd Font Mono"];
  };

  dconf = {
    enable = true;
    settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
  };

  home.pointerCursor = {
    package = pkgs.rose-pine-cursor;
    name = "BreezeX-RosePine-Linux";

    x11.enable = true;
    gtk.enable = true;

    size = 24;
  };
}

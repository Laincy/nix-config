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
    package = pkgs.rose-pine-hyprcursor;
    name = "rose-pine-hyprcursor";
    size = 24;

    gtk.enable = true;
    x11.enable = true;
  };
}

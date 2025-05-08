{pkgs, ...}: {
  stylix = {
    enable = true;

    polarity = "dark";
    image = ../assets/outing.jpg;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";

    cursor = {
      package = pkgs.rose-pine-hyprcursor;
      name = "rose-pine-hyprcursor";
      size = 24;
    };

    fonts.monospace = {
      package = pkgs.nerd-fonts.aurulent-sans-mono;
      name = "AurulentSansM Nerd Font Mono";
    };

    targets.gtk.enable = false;
  };

  gtk = {
    enable = true;

    theme = {
      package = pkgs.rose-pine-gtk-theme;
      name = "rose-pine";
    };
  };
}

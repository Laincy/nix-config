{pkgs, inputs, ...}: {
  stylix = {
    enable = true;

    polarity = "dark";
    image = ../assets/outing.jpg;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";

    cursor = {
      package = inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default;
      name = "rose-pine-hyprcursor";
      size = 24;
    };

    fonts.monospace = {
      package = pkgs.nerd-fonts.aurulent-sans-mono;
      name = "AurulentSansM Nerd Font Mono";
    };
  };
}

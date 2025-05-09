{pkgs, ...}: {
  imports = [
    ./cli
    ./desktop
    ./unfree
  ];

  home.packages = with pkgs; [
    languagetool
    glow
    nerd-fonts.aurulent-sans-mono
  ];
}

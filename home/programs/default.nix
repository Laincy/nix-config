{pkgs, ...}: {
  imports = [
    ./cli
    ./desktop
    ./unfree
  ];

  home.packages = with pkgs; [
    languagetool
    glow
  ];
}

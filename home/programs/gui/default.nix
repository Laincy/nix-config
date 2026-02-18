{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./alacritty.nix
    ./firefox.nix
    ./prism.nix
    ./tofi.nix
  ];

  home.packages = with pkgs; [
    foliate
    bruno
    dbeaver-bin
  ];

  home.persistence."/persist/home/${config.home.username}".directories = [
    ".local/share/flatpak"
    ".local/share/JetBrains"
    ".var/app/org.vinegarhq.Sober"
    ".local/share/com.github.johnfactotum.Foliate"
  ];
}

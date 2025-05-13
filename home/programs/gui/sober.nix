{config, ...}: {
  home.persistence."/persist/home/${config.home.username}".directories = [
    ".local/share/flatpak"
    ".var/app/org.vinegarhq.Sober"
  ];
}

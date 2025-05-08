{
  config,
  inputs,
  ...
}: {
  imports = [
    inputs.nix-flatpak.homeManagerModules.nix-flatpak
  ];
  services.flatpak = {
    uninstallUnmanaged = true;
    packages = [
      "org.vinegarhq.Sober"
    ];
  };

  home.persistence."/persist/home/${config.home.username}".directories = [
    ".var/app/org.vinegarhq.Sober"
    ".local/share/flatpak/"
  ];
}

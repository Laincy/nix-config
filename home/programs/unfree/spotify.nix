{
  pkgs,
  config,
  ...
}: {
  home = {
    packages = with pkgs; [
      spotify
    ];

    persistence."/persist/home/${config.home.username}".directories = [
      ".config/spotify"
      ".cache/spotify"
    ];
  };
}

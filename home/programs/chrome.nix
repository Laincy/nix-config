{
  pkgs,
  config,
  ...
}: {
  # Literally just for school and work related things

  home = {
    packages = with pkgs; [
      google-chrome
    ];

    persistence."/persist/home/${config.home.username}".directories = [
      ".config/google-chrome"
    ];
  };
}

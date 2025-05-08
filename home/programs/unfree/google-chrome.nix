{
  config,
  pkgs,
  ...
}: {
  # For school and work related things
  home = {
    packages = with pkgs; [google-chrome];

    persistence."/persist/home/${config.home.username}".directories = [".config/google-chrome"];
  };
}

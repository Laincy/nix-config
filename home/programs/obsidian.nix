{
  pkgs,
  config,
  ...
}: {
  home = {
    packages = with pkgs; [
      obsidian
    ];

    persistence."/persist/home/${config.home.username}".directories = [
      ".config/obsidian/"
    ];
  };
}

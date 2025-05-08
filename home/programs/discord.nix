{
  pkgs,
  config,
  ...
}: {
  home = {
    packages = with pkgs; [
      (discord.override {
        withOpenASAR = false;
        withVencord = true;
      })
    ];

    persistence."/persist/home/${config.home.username}".directories = [
      ".config/discord"
    ];
  };
}

{
  config,
  pkgs,
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

    file = {
      ".config/Vencord/settings/settings.json".source = ./vencord.json;
    };
  };
}

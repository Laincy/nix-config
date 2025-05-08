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
      ".config/Vencord/themes/rose-pine.theme.css".source = ./rose-pine.css;
      ".config/Vencord/settings/settings.json".source = ./vencord.json;
    };
  };
}

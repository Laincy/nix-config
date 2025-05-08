{
  pkgs,
  inputs,
  config,
  ...
}: {
  home.persistence."/persist/home/${config.home.username}".directories = [
    ".mozilla"
    ".cache/mozilla"
  ];

  programs.firefox = {
    enable = true;

    profiles."${config.home.username}"= {
      extensions.packages = with inputs.firefox-addons.packages.${pkgs.system}; [
        ublock-origin
        bitwarden
        darkreader
      ];
    };
  };

  stylix.targets.firefox.profileNames = ["${config.home.username}"];
}

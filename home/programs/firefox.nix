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

    profiles.laincy = {
      extensions = with inputs.firefox-addons.packages.${pkgs.system}; [
        ublock-origin
        bitwarden
        darkreader
      ];
    };
  };
}

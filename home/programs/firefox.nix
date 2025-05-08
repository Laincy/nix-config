{
  config,
  inputs,
  pkgs,
  ...
}: let
  username = config.home.username;
in {
  programs.firefox = {
    enable = true;

    profiles."${username}" = {
      extensions.packages = with inputs.firefox-addons.packages.${pkgs.system}; [
        ublock-origin
        bitwarden
        darkreader
      ];
    };
  };

  home.persistence."/persist/home/${username}".directories = [
    ".mozilla"
    ".cache/mozilla"
  ];

	stylix.targets.firefox.profileNames = ["${username}"];
}

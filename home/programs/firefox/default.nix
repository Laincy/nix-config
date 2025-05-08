{
  pkgs,
  inputs,
  ...
}: {
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

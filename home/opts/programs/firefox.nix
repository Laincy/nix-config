{
  config,
  inputs,
  pkgs,
  ...
}: let
  username = config.home.username;
  icons = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps";
in {
  programs.firefox = {
    enable = true;

    policies = {
      OfferToSaveLogins = false;
      PasswordManagerEnabled = false;
      DisablePocket = true;
    };

    profiles."${username}" = {
      search = {
        force = true;
        order = ["google" "Nix Packages" "Nix Options" "Noogle"];
        engines = {
          bing.metaData.hidden = true;
          ddg.metaData.hidden = true;

          "Nix Packages" = {
            urls = [
              {
                template = "https://search.nixos.org/packages";
                params = [
                  {
                    name = "type";
                    value = "packages";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];

            icon = "${icons}/nix-snowflake.svg";
            definedAliases = ["@np"];
          };

          "Nix Options" = {
            urls = [
              {
                template = "https://search.nixos.org/options";
                params = [
                  {
                    name = "type";
                    value = "packages";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];

            icon = "${icons}/nix-snowflake.svg";
            definedAliases = ["@no"];
          };

          "Noogle" = {
            urls = [
              {
                template = "https://noogle.dev/q";
                params = [
                  {
                    name = "term";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            icon = "${icons}/nix-snowflake-white.svg";
            definedAliases = ["@ng"];
          };
        };
      };

      extensions.packages = with inputs.firefox-addons.packages.${pkgs.system}; [
        ublock-origin
        bitwarden
        darkreader
      ];
    };
  };

  home.persistence."/persist/home/${username}".directories = [
    ".mozilla/firefox/${username}"
  ];

  stylix.targets.firefox.profileNames = ["${username}"];
}

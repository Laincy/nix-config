{
  pkgs,
  config,
  ...
}: let
  # Shamelessly stolen function, see Misterio77's config
  ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in {
  users.users.laincy = {
    isNormalUser = true;
    shell = pkgs.nushell;
    extraGroups = ifTheyExist [
      "networkmanager"
      "wheel"
      "pipewire"
    ];
    hashedPassword = "$6$NQgk/wiGzQAeuYQ1$r6TMm/d7/p4jonR.gDbTtYhB0lp8ToZLNvFbz0LGJnkGlKYtquOtCDHgD5UfF92.ntHj7RcWpRa3SDupgQhcP1";
  };

  home-manager.users.laincy = import ../../../home/${config.networking.hostName}.nix;
}

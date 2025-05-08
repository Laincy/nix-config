{
  inputs,
  pkgs,
  self,
  ...
}: let
  username = "laincy";
in {
  users.users.${username} = {
    isNormalUser = true;
    hashedPassword = "$6$NQgk/wiGzQAeuYQ1$r6TMm/d7/p4jonR.gDbTtYhB0lp8ToZLNvFbz0LGJnkGlKYtquOtCDHgD5UfF92.ntHj7RcWpRa3SDupgQhcP1";
    description = "Laincy's User Account";
    extraGroups = ["networkmanager" "wheel" "pipewire"];
    shell = pkgs.nushell;
  };

  home-manager = {
    extraSpecialArgs = {inherit inputs self;};
    sharedModules = [
      inputs.impermanence.nixosModules.home-manager.impermanence
      inputs.stylix.homeManagerModules.stylix
    ];

    users.${username} = import ../home;
  };
}

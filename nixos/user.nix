{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  users.users.laincy = {
    isNormalUser = true;
    hashedPassword = "$6$NQgk/wiGzQAeuYQ1$r6TMm/d7/p4jonR.gDbTtYhB0lp8ToZLNvFbz0LGJnkGlKYtquOtCDHgD5UfF92.ntHj7RcWpRa3SDupgQhcP1";
    description = "Laincy's account";
    extraGroups = ["networkmanager" "wheel" "pipewire"];
    shell = pkgs.nushell;
  };

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users.laincy = import ../home;
  };

  programs.fuse.userAllowOther = true;

  environment.persistence."/persist".users.laincy = {
    directories = [];
  };
}

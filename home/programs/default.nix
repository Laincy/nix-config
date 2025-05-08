{
  config,
  pkgs,
  self,
  ...
}: {
  imports = [
    ./unfree

    ./alacritty.nix
    ./firefox.nix
    ./nushell.nix
    ./tmux.nix
    ./tofi.nix
  ];

  home = {
    persistence."/persist/home/${config.home.username}".files = [
      ".config/gh/hosts.yml"
    ];
    packages = [
      self.packages.${pkgs.system}.nvim
    ];
  };

  programs = {
    git = {
      enable = true;

      extraConfig.init.defaultBranch = "main";

      userName = "laincy";
      userEmail = "laincy@proton.me";
    };

    gh = {
      enable = true;

      settings = {
        version = "1";
        git_protocol = "https";
        prompt = "enabled";
      };
    };
    btop.enable = true;
  };
}

{config, ...}: {
  home.persistence."/persist/home/${config.home.username}".directories = [
    ".local/share/zed"
  ];

  programs.zed-editor = {
    enable = true;

    extensions = [
      "nix"
      "toml"
      "rust"
    ];

    userSettings = {
      disable_ai = true;

      theme = {
        mode = "system";
        dark = "Rosé Pine";
      };

      vim_mode = true;
    };
  };
}

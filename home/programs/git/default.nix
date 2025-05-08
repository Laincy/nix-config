{config, ...}: {
  programs.git = {
    enable = true;

    extraConfig = {
      init.defaultBranch = "main";
    };

    userName = "laincy";
    userEmail = "laincy@proton.me";
  };

  programs.gh = {
    enable = true;

    settings = {
      version = "1";
      git_protocol = "https";
      prompt = "enabled";
      editor = config.prefs.editor;
    };
  };
}

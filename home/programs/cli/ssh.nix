{...}: {
  programs.ssh = {
    enable = true;
    extraConfig = "identityFile /run/secrets/user-ssh-key";
  };
}

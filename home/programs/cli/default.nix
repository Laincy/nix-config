{...}: {
  imports = [
    ./ssh.nix
    ./git.nix
    ./nushell.nix
    ./tmux.nix
  ];

  programs.btop.enable = true;
}

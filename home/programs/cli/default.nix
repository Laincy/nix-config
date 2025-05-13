{pkgs, ...}: {
  imports = [
    ./git.nix
    ./nushell.nix
    ./ssh.nix
    ./tmux.nix
  ];

  home.packages = with pkgs; [glow];
}

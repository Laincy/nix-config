{pkgs, ...}: {
  imports = [
    ./fish.nix
    ./git.nix
    ./ssh.nix
    ./tmux.nix
  ];

  home.packages = with pkgs; [glow];
}

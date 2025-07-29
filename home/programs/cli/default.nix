{pkgs, ...}: {
  imports = [
    ./fish.nix
    ./git.nix
    ./helix.nix
    ./ssh.nix
    ./tmux.nix
  ];

  home.packages = with pkgs; [
    glow
    tree
    du-dust
  ];
}

{...}: {
  imports = [
    ./tmux
    ./nushell
    ./alacritty
    ./firefox
    ./git
    ./discord
    ./nixvim
		./obsidian.nix
  ];

  programs = {
    btop.enable = true;
    wofi.enable = true;
  };
}

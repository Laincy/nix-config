{lib, ...}: {
  imports = [
    ./obsidian.nix
    ./alacritty.nix
    ./discord.nix
    ./firefox.nix
    ./git.nix
    ./nushell.nix
    ./spotify.nix
    ./tmux.nix

		./nixvim
  ];


  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "discord"
			"spotify"
			"obsidian"
    ];

  programs = {
    btop.enable = true;
    wofi.enable = true;
  };
}

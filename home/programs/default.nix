{lib, pkgs,...}: {
  imports = [
    ./obsidian.nix
    ./alacritty.nix
    ./discord.nix
    ./firefox.nix
    ./git.nix
    ./nushell.nix
    ./spotify.nix
    ./tmux.nix
		./chrome.nix

		./nixvim
		./prism.nix
  ];


  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "discord"
			"spotify"
			"obsidian"
			"google-chrome"
    ];

  programs = {
    btop.enable = true;
    wofi.enable = true;
  };

	home.packages = with pkgs; [
		inkscape
	];
}

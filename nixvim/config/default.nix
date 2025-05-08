{pkgs, ...}: {
  imports = [
    ./plugins
    ./opts.nix
    ./keymaps.nix
  	./bufferline.nix
	];

  extraPackages = with pkgs; [
    ripgrep
  ];

	colorschemes.rose-pine.enable = true;
}

{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.nixvim.homeManagerModules.nixvim];

  stylix.targets.nixvim.enable = false;

  programs.nixvim = {
    enable = true;

    defaultEditor = true;

    extraPackages = with pkgs; [
      ripgrep
    ];

    colorschemes.rose-pine.enable = true;

    keymaps = import ./binds.nix;

    globals.mapleader = " ";

    globalOpts = import ./opts.nix;

    plugins = import ./plugins;

    extraConfigLua = ''
      vim.o.termguicolors = true
    '';
  };
}

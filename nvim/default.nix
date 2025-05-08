{pkgs, ...}: {
  imports = [
    ./plugins
    ./binds.nix
  ];

  extraPackages = with pkgs; [ripgrep];

  colorschemes.rose-pine.enable = true;

  globalOpts = {
    number = true;
    relativenumber = true;

    tabstop = 2;
    shiftwidth = 2;

    fillchars.eob = " ";
  };

  dependencies.gcc.enable = true;

  extraConfigLua = ''
    vim.o.termguicolors = true
    vim.g.zig_fmt_parse_errors = 0
    vim.o.wrap = false
  '';
}

{pkgs, ...}: {
  lspsAndRuntimeDeps = {
    general = with pkgs; [
      ripgrep
      fd
    ];

    lua = with pkgs; [
      lua-language-server
      stylua
    ];

    nix = with pkgs; [
      nixd
      alejandra
    ];

    markdown = with pkgs; [
      markdownlint-cli2
    ];

    zig = with pkgs; [
      zls
    ];
  };

  startupPlugins = {
    general = with pkgs.vimPlugins; [
      lze
      lzextras
      rose-pine
      plenary-nvim
      nvim-web-devicons
    ];
  };

  optionalPlugins = {
    general = {
      # Essential plugins, dependencies
      core = with pkgs.vimPlugins; [
        nvim-lspconfig
        nvim-treesitter.withAllGrammars
        indent-blankline-nvim-lua
      ];

      # Plugins for managing codestyle
      style = with pkgs.vimPlugins; [
        conform-nvim
        nvim-lint
      ];

      # Extra utility plugins
      extra = with pkgs.vimPlugins; [
        telescope-nvim
        neo-tree-nvim
        lualine-nvim
      ];
    };

    cmp = with pkgs.vimPlugins; [
      luasnip
      blink-cmp
      cmp-cmdline
      blink-compat
    ];

    markdown = with pkgs.vimPlugins; [
      markview-nvim
    ];
  };
}

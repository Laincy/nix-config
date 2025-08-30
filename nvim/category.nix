{pkgs, ...}: let
  moonfly = pkgs.vimUtils.buildVimPlugin {
    name = "moonfly";
    src = pkgs.fetchFromGitHub {
      owner = "bluz71";
      repo = "vim-moonfly-colors";
      rev = "164888b0140d6a4ba3f5ec5d760d46fb6a417d7a";
      hash = "sha256-XlXgJgxlaOzBIaHUtCQrNJFSvOCxdqa4NnuDmaF2mzY=";
    };
  };
in {
  lspsAndRuntimeDeps = {
    general = with pkgs; [
      ripgrep
      fd
      commitlint-rs
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
      markdownlint-cli
    ];

    zig = with pkgs; [
      zls
    ];

    rust = with pkgs; [
      clippy
      rust-analyzer
      cargo
    ];

    sql = with pkgs; [
      sql-formatter
      sqls
    ];

    docker = with pkgs; [
      docker-language-server
      dockerfmt
    ];
  };

  startupPlugins = {
    general = with pkgs.vimPlugins; [
      lze
      lzextras
      plenary-nvim
      nvim-web-devicons

      rose-pine
      moonfly
    ];
  };

  optionalPlugins = {
    general = {
      # Essential plugins, dependencies
      core = with pkgs.vimPlugins; [
        nvim-lspconfig
        nvim-treesitter.withAllGrammars
        indent-blankline-nvim-lua
        trouble-nvim
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
        lualine-lsp-progress
        presence-nvim
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

{...}: {
  plugins.treesitter = {
    enable = true;
    nixGrammars = true;

    settings = {
      auto_install = true;
      ensure_installed = [
        "nix"
        "rust"
        "zig"
        "markdown"
        "gitcommit"
      ];
      highlight.enable = true;
      indent.enable = true;
    };
  };
}

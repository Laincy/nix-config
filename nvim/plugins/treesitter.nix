{...}: {
  plugins.treesitter = {
    enable = true;
    settings = {
      auto_install = true;
      ensure_installed = ["nix" "rust" "zig"];
      indent.enable = true;
      highlight.enable = true;
    };
  };
}

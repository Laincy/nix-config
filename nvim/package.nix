{
  pkgs,
  name,
  mkPlugin,
  ...
}: {
  # they contain a settings set defined above
  # see :help nixCats.flake.outputs.settings
  settings = {
    suffix-path = true;
    suffix-LD = true;
    wrapRc = true;
    # IMPORTANT:
    # your aliases may not conflict with your other packages.
    aliases = ["vim"];
    # neovim-unwrapped = inputs.neovim-nightly-overlay.packages.${pkgs.system}.neovim;
  };
  # and a set of categories that you want
  categories = {
    general = true;
    lua = true;
    nix = true;
    cmp = true;
    markdown = true;
    zig = true;
    rust = true;
  };
  # anything else to pass and grab in lua with `nixCats.extra`
  extra = {};
}

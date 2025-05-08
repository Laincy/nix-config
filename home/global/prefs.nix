{
  lib,
  config,
  ...
}: let
  inherit (lib) mkOption types;
in {
  options.prefs = {
    terminal = mkOption {
      type = types.str;
    };
    launcher = mkOption {
      type = types.str;
    };
    editor = mkOption {
      type = types.str;
      default = config.home.sessionVariables.EDITOR;
    };
  };
}

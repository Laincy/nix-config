# Common preferences across all wayland desktop
{config, ...}: let
  alacritty = "${config.programs.alacritty.package}/bin/alacritty";
in {
  imports = [
    ./default.nix

    ../../programs/alacritty.nix

    ../../programs/tofi.nix
  ];

  xdg.mimeApps = {
    associations.added = {
      "x-scheme-handler/terminal" = alacritty;
    };
    defaultApplications = {
      "x-scheme-handler/terminal" = alacritty;
    };
  };

  home.sessionVariables.NIXOS_OZONE_WL = 1;

  prefs = {
    terminal = alacritty;
    launcher = "${config.programs.tofi.package}/bin/tofi-drun";
  };
}

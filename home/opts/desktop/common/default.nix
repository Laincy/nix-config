{pkgs, ...}: {
  imports = [
    ./monitors.nix

    ../../programs/firefox.nix
    ../../programs/unfree
    ../../programs/tmux.nix
  ];

  xdg.portal = {
    enable = true;
    config.common.default = ["gtk"];
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
    xdgOpenUsePortal = true;
  };

  programs.btop.enable = true;
}

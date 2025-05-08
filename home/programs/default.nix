{...}: {
  imports = [
    ./nushell
    ./alacritty
    ./firefox
    ./git
    ./discord
  ];

  programs = {
    btop.enable = true;
    wofi.enable = true;
  };
}

{...}: {
  imports = [
    ./tmux
    ./nushell
    ./alacritty
    ./firefox
    ./git
    ./discord
    ./nixvim
  ];

  programs = {
    btop.enable = true;
    wofi.enable = true;
  };
}

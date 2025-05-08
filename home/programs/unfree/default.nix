{lib, ...}: {
  imports = [
    ./discord

    ./google-chrome.nix
    ./obsidian.nix
    ./spotify.nix
  ];

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "discord"
      "google-chrome"
      "obsidian"
      "spotify"
    ];
}

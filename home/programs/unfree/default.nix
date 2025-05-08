{lib, ...}: {
  imports = [
    ./discord

    ./google-chrome.nix
    ./obsidian.nix
  ];
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "discord"
      "google-chrome"
      "obsidian"
      "spotify"
    ];
}

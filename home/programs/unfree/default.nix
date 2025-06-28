{lib, ...}: {
  imports = [
    ./discord.nix
    ./obsidian.nix
  ];

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "discord"
      "obsidian"
    ];
}

{lib, ...}: {
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "nvidia-x11"
      "nvidia-settings"
      "intel-ocl"

      "steam"
      "steam-original"
      "steam-unwrapped"
      "steam-run"
      "via"
    ];
}

{config, ...}: {
  services.flatpak = {
    remotes = {
      "flathub" = "https://dl.flathub.org/repo/flathub.flatpakrepo";
    };
    packages = [
      "flathub:app/org.vinegarhq.Sober/x86_64/stable"
    ];

    overrides."org.vinegarhq.Sober" = {
      environment = {
        "__NV_PRIME_RENDER_OFFLOAD" = 1;
        "__NV_PRIME_RENDER_OFFLOAD_PROVIDER" = "NVIDIA-G0";
        "__GLX_VENDOR_LIBRARY_NAME" = "nvidia";
        "__VK_LAYER_NV_optimus" = "NVIDIA_only";
      };
      filesystems = [
        "xdg-run/app/com.discordapp.Discord:create"
        "xdg-run/discord-ipc-0"
      ];

      sockets = [
        "!wayland"
        "!fallback-x11"
        "x11"
      ];
    };
  };

  home.persistence."/persist/home/${config.home.username}".directories = [
    ".var/app/org.vinegarhq.Sober"
    ".local/share/flatpak/"
  ];
}

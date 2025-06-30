{pkgs, ...}: {
  hardware = {
    # intelgpu.vaapiDriver = "intel-media-driver";

    graphics = {
      enable = true;

      extraPackages = with pkgs; [
        intel-media-driver
        intel-ocl
        intel-vaapi-driver
        vpl-gpu-rt
      ];

      extraPackages32 = with pkgs.pkgsi686Linux; [
        intel-media-driver
        intel-vaapi-driver
      ];
    };

    nvidia = {
      open = true;
      modesetting.enable = true;
      powerManagement.enable = true;

      prime = {
        sync.enable = true;

        offload = {
          enable = false;
          enableOffloadCmd = false;
        };

        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };
  };

  services.xserver.videoDrivers = [
    "modesetting"
    "nvidia"
  ];
}

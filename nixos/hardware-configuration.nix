{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = ["xhci_pci" "thunderbolt" "nvme" "usb_storage" "sd_mod" "sdhci_pci"];
  boot.initrd.kernelModules = ["dm-snapshot"];
  boot.kernelModules = ["kvm-intel"];
  boot.extraModulePackages = [];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  # Added settings

  hardware = {
    graphics = {
      enable = true;

      extraPackages = with pkgs; [
        #(intel-vaapi-driver.override {enableHybridCodec = true;})
        intel-media-driver
      ];
      extraPackages32 = with pkgs.driversi686Linux; [
        #(intel-vaapi-driver.override {enableHybridCodec = true;})
        intel-media-driver
      ];
    };

    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;

      open = true;

      prime = {
        sync.enable = true;

        #offload = {
        #  enable = lib.mkOverride 990 true;
        #  enableOffloadCmd = true;
        #};

        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;

  services.xserver.videoDrivers = ["nvidia"];

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "nvidia-x11"
      "nvidia-settings"
    ];
}

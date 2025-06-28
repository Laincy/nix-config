{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  # Generated Settings
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = ["xhci_pci" "thunderbolt" "nvme" "sdhci_pci"];
  boot.initrd.kernelModules = ["dm-snapshot"];
  boot.kernelModules = ["kvm-intel"];
  boot.extraModulePackages = [];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  # Added Settings

  hardware = {
    graphics = {
      enable = true;

      extraPackages = with pkgs; [
        intel-vaapi-driver
        intel-media-driver
      ];
      extraPackages32 = with pkgs.driversi686Linux; [
        intel-vaapi-driver
        intel-media-driver
      ];
    };

    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;

      open = false;

      prime = {
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };

        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;

  services.xserver.videoDrivers = ["nvidia"];

  disko.devices.disk.main.device = "/dev/nvme0n1";
}

{
  inputs,
  lib,
  ...
}: {
  imports = [inputs.lanzaboote.nixosModules.lanzaboote];

  boot = {
    lanzaboote = {
      enable = true;
      pkiBundle = "/var/lib/sbctl";
    };

    loader = {
      systemd-boot.enable = lib.mkForce false;
      grub.enable = lib.mkForce false;
    };
  };
}

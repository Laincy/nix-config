# Adapted from Misterio77's setup
# https://github.com/Misterio77/nix-config/blob/main/hosts/common/global/optin-persistence.nix
{
  config,
  inputs,
  lib,
  ...
}: {
  imports = [inputs.impermanence.nixosModule];

  environment.persistence."/persist" = {
    files = ["/etc/machine-id"];
    directories = [
      "/var/lib/systemd"
      "/var/log"
      "/var/lib/sbctl"
      "/var/lib/nixos"
      "/var/lib/bluetooth"
      "/etc/NetworkManager/system-connections"
      "/var/lib/systemd/coredump"
    ];
  };

  programs.fuse.userAllowOther = true;

  boot.initrd.postDeviceCommands = lib.mkAfter ''
    mkdir /btrfs_tmp
    mount /dev/root_vg/root /btrfs_tmp
    if [[ -e /btrfs_tmp/root ]]; then
        mkdir -p /btrfs_tmp/old_roots
        timestamp=$(date --date="@$(stat -c %Y /btrfs_tmp/root)" "+%Y-%m-%-d_%H:%M:%S")
        mv /btrfs_tmp/root "/btrfs_tmp/old_roots/$timestamp"
    fi

    delete_subvolume_recursively() {
        IFS=$'\n'
        for i in $(btrfs subvolume list -o "$1" | cut -f 9- -d ' '); do
            delete_subvolume_recursively "/btrfs_tmp/$i"
        done
        btrfs subvolume delete "$1"
    }

    for i in $(find /btrfs_tmp/old_roots/ -maxdepth 1 -mtime +30); do
        delete_subvolume_recursively "$i"
    done

    btrfs subvolume create /btrfs_tmp/root
    umount /btrfs_tmp
  '';

  security.sudo.extraConfig = ''Defaults lecture="never"'';

  system.activationScripts.persistent-dirs.text = let
    mkHomePersist = user:
      lib.optionalString user.createHome ''
        mkdir -p /persist${user.home}
        chown ${user.name}:${user.group} /persist${user.home}
      '';
    # TODO make this only work when user will have home directory
    users = lib.attrValues config.users.users;
  in
    lib.concatLines (map mkHomePersist users);
}

{ ... }: {
  flake.nixosModules.disks-sys-singledisk-deck = { inputs, ... }: {
    imports = [ inputs.disko.nixosModules.disko ];

    disko.enableConfig = false;

    fileSystems."/" = {
      device = "/dev/disk/by-label/root";
      fsType = "xfs";
    };

    fileSystems."/boot" = {
      device = "/dev/disk/by-label/boot";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

    swapDevices = [{
      device = "/var/lib/swapfile";
      size = 16 * 1024;
    }];
  };
}

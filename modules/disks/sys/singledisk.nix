{ ... }: {
  flake.nixosModules.disks-sys-singledisk = { inputs, lib, ... }: {
    imports = [ inputs.disko.nixosModules.disko ];

    disko.devices = {
      disk = {
        main = {
          type = "disk";
          device = "/dev/nvme0n1";
          content = {
            type = "gpt";
            partitions = {
              ESP = {
                size = "512M";
                type = "EF00";
                content = {
                  type = "filesystem";
                  format = "vfat";
                  mountpoint = "/boot";
                  mountOptions = [ "fmask=0077" "dmask=0077" ];
                  extraArgs = [ "-n" "boot" ];
                };
              };
              luks = {
                size = "100%";
                content = {
                  type = "luks";
                  name = "cryptroot";
                  settings.allowDiscards = true;
                  content = {
                    type = "filesystem";
                    format = "xfs";
                    mountpoint = "/";
                    extraArgs = [ "-L" "root" ];
                  };
                };
              };
            };
          };
        };
      };
    };

    swapDevices = [{
      device = "/var/lib/swapfile";
      size = 16 * 1024;
    }];

    boot.initrd.luks.devices."cryptroot" = {
      device = lib.mkForce "/dev/nvme0n1p2";
    };
  };
}

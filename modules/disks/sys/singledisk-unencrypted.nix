{ ... }: {
  flake.nixosModules.disks-sys-singledisk-unencrypted = { inputs, ... }: {
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
                size = "1024M";
                type = "EF00";
                content = {
                  type = "filesystem";
                  format = "vfat";
                  mountpoint = "/boot";
                  mountOptions = [ "fmask=0077" "dmask=0077" ];
                  extraArgs = [ "-n" "boot" ];
                };
              };
              root = {
                size = "100%";
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
    swapDevices = [{
      device = "/var/lib/swapfile";
      size = 16 * 1024;
    }];
  };
}

{ ... }: {
  flake.nixosModules.disks-sys-singledisk-encrypted-sda = { inputs, lib, ... }: {
    imports = [ inputs.disko.nixosModules.disko ];
    disko.devices = {
      disk = {
        main = {
          type = "disk";
          device = "/dev/sda";
          content = {
            type = "gpt";
            partitions = {
              boot = {
                size = "1M";
                type = "EF02";
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
      size = 4 * 1024;
    }];
    boot.initrd.luks.devices."cryptroot" = {
      device = "/dev/sda2";
    };
  };
}

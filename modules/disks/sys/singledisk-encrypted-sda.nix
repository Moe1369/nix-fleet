{ ... }: {
  flake.nixosModules.disks-sys-singledisk-encrypted-sda = { inputs, lib, ... }: {
    imports = [ inputs.disko.nixosModules.disko ];
    
    disko.devices = {
      disk = {
        main = {
          type = "disk";
          device = "/dev/sda";
          content = {
            type = "table"; 
            format = "msdos";
            
            partitions = [
              {
                name = "boot";
                bootable = true;
                size = "1G";
                content = {
                  type = "filesystem";
                  format = "ext4";
                  mountpoint = "/boot";
                };
              }
              {
                name = "luks";
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
              }
            ];
          };
        };
      };
    };

    swapDevices = [{
      device = "/var/lib/swapfile";
      size = 4 * 1024;
    }];
  };
}

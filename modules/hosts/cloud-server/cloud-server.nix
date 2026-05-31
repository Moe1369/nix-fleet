{ inputs, config, ... }: {
  flake.nixosConfigurations."cloud-server" = inputs.self.lib.mkHost {
    system = "x86_64-linux";
    host   = "cloud-server";
    user   = "administrator";
  };

  flake.nixosModules.cloud-server = { system, ... }: {
    imports = with inputs.self.nixosModules; [
      base-sys-group-server
      disks-sys-singledisk-encrypted-vda
      platform-sys-cache
      platform-sys-upgrades
      security-sys-sopsnix
      services-sys-authelia
      services-sys-caddy
      services-sys-stalwart
      users-sys-administrator
    ];
    
    home-manager.users.administrator.imports = with config.flake.homeModules; [
      base-usr-group
      security-usr-sopsnix
    ];
    
    boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "ahci" "virtio_pci" "virtio_blk" "virtio_scsi" "sd_mod" ];
    nixpkgs.hostPlatform = system;
    services.qemuGuest.enable = true;
    services.spice-vdagentd.enable = true;
  };
}

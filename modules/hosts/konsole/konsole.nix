{ inputs, config, ... }: {
  flake.nixosConfigurations."konsole" = inputs.self.lib.mkHost {
    system = "x86_64-linux";
    host   = "konsole";
    user   = "mo";
  };

  flake.nixosModules.konsole = { system, ... }: {
    imports = with inputs.self.nixosModules; [
      apps-sys-brave
      base-sys-group
      desktop-sys-group
      disks-sys-singledisk-encrypted
      gaming-sys-controller
      gaming-sys-lact
      gaming-sys-jovian
      kde-sys-plasma
      kde-sys-plasma-apps
      kde-sys-sddm
      platform-sys-cache
      platform-sys-upgrades
      security-sys-sopsnix
      security-sys-secureboot
      security-sys-sudo
      users-sys-mo
    ];
    home-manager.users.mo.imports = with config.flake.homeModules; [
      base-usr-group
      gaming-usr-steam
      gaming-usr-jovian
      kde-usr-plasma-mo
      security-usr-sopsnix
    ];

    boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "ahci" "usbhid" "usb_storage" "sd_mod" ];
    boot.kernelParams = [ "quiet" "splash" "boot.shell_on_fail" "loglevel=3" "rd.systemd.show_status=false" "rd.udev.log_level=3" "udev.log_priority=3" ];
    boot.initrd.kernelModules = [ "nvme" ];
    nixpkgs.hostPlatform = system;
    hardware.cpu.amd.updateMicrocode = true;
  };
}

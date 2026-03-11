{ inputs, config, ... }: {
  flake.nixosConfigurations."deck" = inputs.self.lib.mkHost {
    system = "x86_64-linux";
    host   = "deck";
  };

  flake.nixosModules.deck = { system, ... }: {
    imports = with inputs.self.nixosModules; [
      apps-sys-chrome
      apps-sys-vesktop
      base-sys-group
      desktop-sys-group
      disks-sys-singledisk-unencrypted
      gaming-sys-controller
      gaming-sys-jovian
      kde-sys-plasma
      kde-sys-plasma-apps
      platform-sys-cache
      platform-sys-upgrades
      security-sys-sopsnix
      users-sys-deck
    ];
    home-manager.users.deck.imports = with config.flake.homeModules; [
      apps-usr-vesktop-all
      base-usr-group
      gaming-usr-steam-all
      kde-usr-plasma-deck
      security-usr-sopsnix
    ];

    boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "ahci" "usbhid" "usb_storage" "sd_mod" ];
    boot.kernelParams = [ "quiet" "splash" "boot.shell_on_fail" "loglevel=3" "rd.systemd.show_status=false" "rd.udev.log_level=3" "udev.log_priority=3" ];
    boot.initrd.kernelModules = [ "nvme" ];
    nixpkgs.hostPlatform = system;
    hardware.cpu.amd.updateMicrocode = true;
  };
}

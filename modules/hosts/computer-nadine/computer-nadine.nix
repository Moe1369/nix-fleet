{ inputs, config, ... }: {
  flake.nixosConfigurations."computer-nadine" = inputs.self.lib.mkHost {
    system = "x86_64-linux";
    host   = "computer-nadine";
  };

  flake.nixosModules.computer-nadine = { system, ... }: {
    imports = with inputs.self.nixosModules; [
      apps-sys-chrome
      apps-sys-vesktop
      base-sys-group
      desktop-sys-group
      disks-sys-singledisk-encrypted
      gaming-sys-controller
      gaming-sys-lact
      gaming-sys-steam
      kde-sys-plasma
      kde-sys-plasma-apps
      kde-sys-sddm-nadine
      platform-sys-cache
      security-sys-secureboot
      security-sys-sopsnix
      users-sys-nadine
    ];
    home-manager.users.nadine.imports = with config.flake.homeModules; [
      apps-usr-vesktop-all
      base-usr-group
      gaming-usr-steam-all
      kde-usr-plasma-nadine
      security-usr-sopsnix
    ];

    boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "ahci" "usbhid" "usb_storage" "sd_mod" ];
    boot.kernelParams = [ "quiet" "splash" "boot.shell_on_fail" "loglevel=3" "rd.systemd.show_status=false" "rd.udev.log_level=3" "udev.log_priority=3" ];
    nixpkgs.hostPlatform = system;
    hardware.cpu.amd.updateMicrocode = true;
  };
}

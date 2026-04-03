{ inputs, config, ... }: {
  flake.nixosConfigurations."computer-mo" = inputs.self.lib.mkHost {
    system = "x86_64-linux";
    host   = "computer-mo";
  };

  flake.nixosModules.computer-mo = { system, ... }: {
    imports = with inputs.self.nixosModules; [
      apps-sys-brave
      apps-sys-libreoffice
      apps-sys-newelle
      apps-sys-ollama
      apps-sys-onepassword
      #apps-sys-teams
      apps-sys-vesktop
      base-sys-group
      desktop-sys-group
      disks-sys-singledisk-encrypted
      gaming-sys-controller
      gaming-sys-lact
      gaming-sys-nexusmods
      gaming-sys-osu
      gaming-sys-steam
      gaming-sys-sunshine
      kde-sys-plasma
      kde-sys-plasma-apps
      kde-sys-sddm-mo
      platform-sys-cache
      platform-sys-upgrades
      security-sys-secureboot
      security-sys-sopsnix
      users-sys-mo
      hypervisor-sys-virtualization
    ];
    home-manager.users.mo.imports = with config.flake.homeModules; [
      apps-usr-onepassword-all
      apps-usr-vesktop-all
      base-usr-group
      gaming-usr-steam-all
      kde-usr-plasma-mo
      security-usr-sopsnix
    ];

    boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "ahci" "usbhid" "usb_storage" "sd_mod" ];
    boot.kernelParams = [ "quiet" "splash" "boot.shell_on_fail" "loglevel=3" "rd.systemd.show_status=false" "rd.udev.log_level=3" "udev.log_priority=3" ];
    nixpkgs.hostPlatform = system;
    hardware.cpu.amd.updateMicrocode = true;
    networking.interfaces."enp11s0".wakeOnLan.enable = true;
    networking.interfaces."wlp10s0".wakeOnLan.enable = true;
  };
}

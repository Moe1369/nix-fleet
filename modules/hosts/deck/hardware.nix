{ ... }: {
  flake.nixosModules.computer-deck = { system, ... }: {
    boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "ahci" "usbhid" "usb_storage" "sd_mod" ];
    boot.kernelParams = [ "quiet" "splash" "boot.shell_on_fail" "loglevel=3" "rd.systemd.show_status=false" "rd.udev.log_level=3" "udev.log_priority=3" ];
    nixpkgs.hostPlatform = system;
    hardware.cpu.amd.updateMicrocode = true;
  };
}

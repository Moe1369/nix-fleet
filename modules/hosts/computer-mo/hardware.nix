{
  flake.nixosModules.computer-mo = {
    boot.initrd.availableKernelModules = [ "xhci_pci" "virtio_pci" "sr_mod" "virtio_blk" "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
    boot.kernelParams = [ "quiet" "splash" "boot.shell_on_fail" "loglevel=3" "rd.systemd.show_status=false" "rd.udev.log_level=3" "udev.log_priority=3"  ];
    nixpkgs.hostPlatform = "x86_64-linux";
    hardware.cpu.amd.updateMicrocode = true;
    networking.hostName = "computer-mo";
    boot.kernelModules = [ "kvm-amd" ];
  };
}

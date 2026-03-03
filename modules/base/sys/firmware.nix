{ ... }: {
  flake.nixosModules.base-sys-firmware = {
    services.fwupd.enable = true;
    hardware.enableAllFirmware = true;
  };
}

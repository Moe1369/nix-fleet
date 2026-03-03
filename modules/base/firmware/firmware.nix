{ ... }: {
  flake.nixosModules.firmware = {
    services.fwupd.enable = true;
    hardware.enableAllFirmware = true;
  };
}

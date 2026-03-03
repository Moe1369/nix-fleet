{ ... }: {
  flake.nixosModules.desktop-sys-bluetooth = {
    hardware.bluetooth.enable = true;
    hardware.bluetooth.powerOnBoot = true;
  };
}

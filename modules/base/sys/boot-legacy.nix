{ ... }: {
  flake.nixosModules.base-sys-boot-legacy = { ... }: {
    boot.loader.grub.enable = true;
    boot.loader.grub.device = "/dev/sda";
    boot.loader.timeout = 1;
    boot.consoleLogLevel = 3;
    boot.initrd.enable = true;
  };
}

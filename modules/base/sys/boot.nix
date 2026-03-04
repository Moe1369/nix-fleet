{ ... }: {
  flake.nixosModules.base-sys-boot = {
    boot.loader.systemd-boot.enable = true;
    boot.loader.systemd-boot.consoleMode = "max";
    boot.loader.efi.canTouchEfiVariables = true;
    boot.loader.timeout = 1;
    boot.consoleLogLevel = 0;
    boot.initrd.verbose = false;
    boot.initrd.enable = true;
    boot.initrd.systemd.enable = true;
    boot.plymouth.enable = true;
    boot.plymouth.theme = "bgrt";
    boot.initrd.luks.devices."cryptroot" = {
      #device = "/dev/disk/by-label/luks";
      crypttabExtraOpts = [ "tpm2-device=auto" ];
    };
  };
}

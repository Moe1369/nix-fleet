{ ... }: {
  flake.nixosModules.base-sys-boot = {lib, ... }:{
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
    device = lib.mkForce "/dev/nvme0n1p2";
      #crypttabExtraOpts = [ "tpm2-device=auto" ];
    };
  };
}

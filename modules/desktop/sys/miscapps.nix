{ ... }: {
  flake.nixosModules.desktop-sys-miscapps = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      pciutils
      aha
    ];
  };
}

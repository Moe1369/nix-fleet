{ ... }: {
  flake.nixosModules.desktop-sys-miscapps = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      vesktop
      pciutils
      aha
    ];
  };
}

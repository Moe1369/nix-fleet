{ ... }: {
  flake.nixosModules.miscapps = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      vesktop
      pciutils
      aha
    ];
  };
}

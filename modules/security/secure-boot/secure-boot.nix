{ ... }: {
  flake.nixosModules.secure-boot = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      sbctl
    ];
  };
}

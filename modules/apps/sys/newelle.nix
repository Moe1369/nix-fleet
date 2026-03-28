{ ... }: {
  flake.nixosModules.apps-sys-newelle = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      newelle
    ];
  };
}

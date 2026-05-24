{ ... }: {
  flake.nixosModules.apps-sys-protonpass = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      proton-pass
    ];
  };
}

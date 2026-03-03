{ ... }: {
  flake.nixosModules.apps-sys-brave = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      brave
    ];
  };
}

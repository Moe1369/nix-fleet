{ ... }: {
  flake.nixosModules.apps-sys-protonsuite = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      proton-pass
      protonmail-desktop
      proton-vpn
      proton-authenticator
    ];
  };
}

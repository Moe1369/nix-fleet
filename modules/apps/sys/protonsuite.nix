{ ... }: {
  flake.nixosModules.apps-sys-protonsuite = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      proton-pass
      protonmail-desktop
      protonvpn-gui
      proton-authenticator
    ];
  };
}

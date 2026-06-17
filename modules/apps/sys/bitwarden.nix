{ ... }: {
  flake.nixosModules.apps-sys-bitwarden = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      bitwarden-desktop
    ];
  };
}

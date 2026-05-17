{ ... }: {
  flake.nixosModules.apps-sys-stremio = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      stremio-linux-shell
    ];
  };
}

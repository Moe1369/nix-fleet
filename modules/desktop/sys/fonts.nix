{ ... }: {
  flake.nixosModules.desktop-sys-fonts = { pkgs-unstable, ... }: {
    environment.systemPackages = with pkgs-unstable; [
      ibm-plex
      adwaita-fonts
    ];
  };
}

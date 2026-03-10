{ ... }: {
  flake.nixosModules.desktop-sys-fonts = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      ibm-plex
      adwaita-fonts
    ];
  };
}

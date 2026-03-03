{ ... }: {
  flake.nixosModules.miscapps = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      vesktop
      ibm-plex
      adwaita-fonts
      pciutils
      aha
    ];
  };
}

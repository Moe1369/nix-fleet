{ ... }: {
  flake.nixosModules.kde-sys-plasma = { pkgs, ... }: {
    services.desktopManager.plasma6.enable = true;
    services.xserver.enable = false;
  };
}

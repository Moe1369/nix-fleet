{ ... }: {
  flake.nixosModules.gnome-sys-gnome = { pkgs, ... }: {
    services.desktopManager.gnome.enable = true;
    services.gnome.core-apps.enable = false;
    services.gnome.core-developer-tools.enable = false;
    services.gnome.games.enable = false;
  };
}

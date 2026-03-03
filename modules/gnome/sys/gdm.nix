{ ... }: {
  flake.nixosModules.gnome-sys-gdm = { ... }:{
    services.displayManager.gdm.enable = true;
  };
}

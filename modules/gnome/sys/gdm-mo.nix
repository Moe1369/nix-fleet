{ ... }: {
  flake.nixosModules.gnome-sys-gdm-mo = { ... }:{
    services.displayManager.autoLogin.enable = true;
    services.displayManager.autoLogin.user = "mo";
  };
}

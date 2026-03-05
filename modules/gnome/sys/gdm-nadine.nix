{ ... }: {
  flake.nixosModules.gnome-sys-gdm-nadine = { ... }:{
    services.displayManager.autoLogin.enable = true;
    services.displayManager.autoLogin.user = "nadine";
  };
}

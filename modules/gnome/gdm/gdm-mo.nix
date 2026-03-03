{ ... }: {
  flake.nixosModules.gdm-mo = { ... }:{
    services.displayManager.gdm.enable = true;
    services.displayManager.autoLogin.enable = true;
    services.displayManager.autoLogin.user = mo;
  };
}

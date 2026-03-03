{ ... }: {
  flake.nixosModules.gdm = { user, ... }:{
    services.displayManager.gdm.enable = true;
    services.displayManager.autoLogin.enable = true;
    services.displayManager.autoLogin.user = user;
  };
}

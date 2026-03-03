{ ... }: {
  flake.nixosModules.gdm = { ... }:{
    services.displayManager.gdm.enable = true;
    #services.displayManager.autoLogin.enable = true;
    #services.displayManager.autoLogin.user = user;
  };
}

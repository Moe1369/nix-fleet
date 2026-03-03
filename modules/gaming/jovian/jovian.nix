{ ... }: {
  flake.nixosModules.jovian = { ... }:{
    jovian.steam.enable = true;
    jovian.steam.autoStart = true;
    #jovian.steam.user = user;
    jovian.steam.desktopSession = "gnome";
  };
}

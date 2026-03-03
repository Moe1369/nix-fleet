{ ... }: {
  flake.nixosModules.jovian = { ... }:{
    jovian.steam.enable = true;
    jovian.steam.autoStart = true;
    jovian.steam.user = deck;
    jovian.steam.desktopSession = "gnome";
  };
}

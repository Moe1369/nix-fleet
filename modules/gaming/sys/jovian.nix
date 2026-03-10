{ ... }: {
  flake.nixosModules.gaming-sys-jovian = { inputs, ... }:{
    imports = [ inputs.jovian-nixos.nixosModules.default ];
    jovian.steam.enable = true;
    jovian.decky-loader.enable = true;
    jovian.decky-loader.stateDir = "/var/lib/decky-loader";
    jovian.decky-loader.user = "decky";
    jovian.devices.steamdeck.autoUpdate = true;
    jovian.steam.autoStart = true;
    jovian.devices.steamdeck.enable = true; 
    jovian.steam.user = "deck";
    jovian.steam.desktopSession = "gnome";
    services.displayManager.sddm.wayland.enable = true;
  };
}

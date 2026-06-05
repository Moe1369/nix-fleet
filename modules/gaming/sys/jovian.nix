{ ... }: {
  flake.nixosModules.gaming-sys-jovian = { inputs,user, ... }:{
    imports = [ inputs.jovian-nixos.nixosModules.default ];
    jovian.steam.enable = true;
    jovian.decky-loader.enable = true;
    jovian.decky-loader.stateDir = "/var/lib/decky-loader";
    jovian.decky-loader.user = user;
    jovian.devices.steamdeck.autoUpdate = false;
    jovian.steam.autoStart = true;
    jovian.steamos.enableHdmiCecIntegration = true;
    jovian.devices.steamdeck.enable = false; 
    jovian.steam.user = user;
    jovian.steam.desktopSession = "plasma";
    services.displayManager.sddm.wayland.enable = true;
    programs.steam.enable = true;
    programs.steam.extest.enable = true;
  };
}

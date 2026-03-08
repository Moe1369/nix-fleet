{ ... }: {
  flake.nixosModules.gaming-sys-jovian = { inputs, ... }:{
    imports = [ inputs.jovian-nixos.nixosModules.default ];
    jovian.steam.enable = true;
    jovian.steam.autoStart = true;
    jovian.steam.user = "deck";
    jovian.steam.desktopSession = "plasma";
    services.displayManager.sddm.wayland.enable = true;
  };
}

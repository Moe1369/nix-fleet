{ ... }: {
  flake.nixosModules.gaming-sys-jovian = { ... }:{
    imports = [ inputs.jovian-nixos.nixosModules.default ];
    jovian.steam.enable = true;
    jovian.steam.autoStart = true;
    jovian.steam.user = "deck";
    jovian.steam.desktopSession = "plasma";
  };
}

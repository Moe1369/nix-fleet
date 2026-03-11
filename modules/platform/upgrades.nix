{ ... }: {
  flake.nixosModules.platform-sys-upgrades = { host, ... }: {
    system.autoUpgrade = {
      enable = true;
      flake = "github:Moe1369/nix-fleet#${host}";
      dates = "Sun 04:00";
    };
  };
}

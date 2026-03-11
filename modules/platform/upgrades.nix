{ ... }: {
  flake.nixosModules.platform-sys-upgrades = { host, ... }: {
    system.autoUpgrade = {
      enable = true;
      flake = "github:Moe1369/nix-fleet#${host}";
      dates = "Sun 04:00";
      persistent = true;
    };
    nix.gc = {
      automatic = true;
      dates = "Sun 04:00";
      options = "--delete-older-than 7d";
      persistent = true;
    };
  };
}

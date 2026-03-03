{ ... }: {
  flake.nixosModules.network = {lib, ... }:{
    networking.firewall.enable = true;
    networking.networkmanager.enable = true;
  };
}

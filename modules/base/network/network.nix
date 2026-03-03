{ ... }: {
  flake.nixosModules.network = {lib, ... }:{
    networking.firewall.enable = true;
    networking.useDHCP = true;
    networking.networkmanager.enable = true;
  };
}

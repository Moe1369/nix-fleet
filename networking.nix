{ ... }: {
  flake.nixosModules.network = {lib, hostName, ... }:{
    networking.firewall.enable = true;
    networking.useDHCP = true;
    networking.networkmanager.enable = true;
  };
}

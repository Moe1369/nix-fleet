{ ... }: {
  flake.nixosModules.base-sys-network = {lib, host, ... }:{
    networking.firewall.enable = true;
    networking.networkmanager.enable = true;
    networking.hostName = host;
  };
}

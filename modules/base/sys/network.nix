{ ... }: {
  flake.nixosModules.base-sys-network = { host, ... }:{
    networking.firewall.enable = true;
    networking.networkmanager.enable = true;
    networking.hostName = host;
  };
}

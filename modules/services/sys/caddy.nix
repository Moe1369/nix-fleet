{ ... }: {
  flake.nixosModules.services-sys-caddy = { ... }: {
    services.caddy = {
      enable = true;
    };
    networking.firewall.allowedTCPPorts = [ 80 443 ];
  };
}

{ ... }: {
  flake.nixosModules.services-sys-caddy = { ... }: {
    services.caddy = {
      enable = true;
      virtualHosts = {
        "auth.chrayed.de" = {
          extraConfig = ''
            reverse_proxy localhost:9091
          '';
        };
        "mailadmin.chrayed.de" = {
          extraConfig = ''
            reverse_proxy localhost:8080
          '';
        };
      };
    };

    networking.firewall.allowedTCPPorts = [ 80 443 ];
  };
}

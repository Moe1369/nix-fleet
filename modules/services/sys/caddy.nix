{ ... }: {
  flake.nixosModules.services-sys-caddy = { ... }: {
    services.caddy = {
      enable = true;
      virtualHosts = {
        "mail.chrayed.de" = {
          extraConfig = ''
            reverse_proxy localhost:8080
          '';
        };
        "mailadmin.chrayed.de" = {
          extraConfig = ''
            reverse_proxy localhost:8888
          '';
        };
      };
    };

    networking.firewall.allowedTCPPorts = [ 80 443 ];
  };
}

{ ... }: {
  flake.nixosModules.services-sys-vaultwarden = { config, lib, ... }: {
    virtualisation.oci-containers.containers."vaultwarden" = {
      image = "vaultwarden/server:1.36.0";
      environment = {
        DOMAIN        = "https://pw.chrayed.de";
        SIGNUPS_ALLOWED = "false";
        WEBSOCKET_ENABLED = "true";
      };
      ports   = [ "127.0.0.1:8222:80" ];
      volumes = [
        "vaultwarden-data:/data"
      ];
    };
    services.caddy.virtualHosts."pw.chrayed.de" = {
      extraConfig = ''
        reverse_proxy localhost:8222
      '';
    };
  };
}

{ ... }: {
  flake.nixosModules.services-sys-bulwark = { config, lib, ... }: {

    virtualisation.oci-containers.containers."bulwark-webmail" = {
      image = "ghcr.io/bulwarkmail/webmail:1.7.4";
      environment = {
        HOSTNAME = "0.0.0.0";
        PORT     = "3000";
      };
      ports   = [ "127.0.0.1:3000:3000" ];
      volumes = [
        "bulwark-data:/app/data"
      ];
    };

    services.caddy.virtualHosts."webmail.chrayed.de" = {
      extraConfig = ''
        reverse_proxy localhost:3000
      '';
    };
  };
}

{ ... }: {
  flake.nixosModules.services-sys-stalwart = { config, lib, ... }: {
    sops.secrets."services/stalwart/adminpass" = {
      owner = "stalwart-mail";
    };
    sops.secrets."services/stalwart/oauth-secret" = {
      owner = "stalwart-mail";
    };
    virtualisation.oci-containers.containers."stalwart-mail" = {
      image = "stalwartlabs/mail-server:latest";
      environment = {
        STALWART_PUBLIC_URL = "https://mailadmin.chrayed.de";
      };
      ports = [
        "0.0.0.0:25:25"
        "0.0.0.0:587:587"
        "0.0.0.0:465:465"
        "0.0.0.0:143:143"
        "0.0.0.0:993:993"
        "127.0.0.1:8080:8080"
      ];
      volumes = [
        "stalwart-data:/opt/stalwart-mail/data"
        "stalwart-etc:/opt/stalwart-mail/etc"
        "stalwart-logs:/opt/stalwart-mail/logs"
        "${config.sops.secrets."services/stalwart/adminpass".path}:/run/secrets/adminpass:ro"
        "${config.sops.secrets."services/stalwart/oauth-secret".path}:/run/secrets/oauth_secret:ro"
      ];
    };
    services.caddy.virtualHosts."mailadmin.chrayed.de" = {
      extraConfig = ''
        reverse_proxy localhost:8080
      '';
    };
    networking.firewall.allowedTCPPorts = [ 25 465 587 143 993 ];
  };
}

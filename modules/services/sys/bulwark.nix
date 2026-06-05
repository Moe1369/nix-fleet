{ ... }: {
  flake.nixosModules.services-sys-bulwark = { config, lib, ... }: {
    sops.secrets."services/bulwark/env" = {};
    sops.secrets."services/bulwark/oauth-secret" = {};

    virtualisation.oci-containers.containers."bulwark-webmail" = {
      image = "ghcr.io/bulwarkmail/webmail:latest";
      environment = {
        HOSTNAME = "0.0.0.0";
        PORT     = "3000";
      };
      environmentFiles = [
        config.sops.secrets."services/bulwark/env".path
      ];
      ports   = [ "127.0.0.1:3000:3000" ];
      volumes = [
        "bulwark-settings:/app/data/settings"
        "bulwark-admin:/app/data/admin"
        "bulwark-admin-state:/app/data/admin-state"
        "bulwark-telemetry:/app/data/telemetry"
        "${config.sops.secrets."services/bulwark/oauth-secret".path}:/run/secrets/oauth_secret:ro"
      ];
    };

    services.caddy.virtualHosts."mail.chrayed.de" = {
      extraConfig = ''
        reverse_proxy localhost:3000
      '';
    };
  };
}

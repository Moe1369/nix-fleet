{ ... }: {
  flake.nixosModules.services-sys-kanidm = { config, pkgs, ... }: {
    sops.secrets."services/kanidm/admin-password" = {
      owner = "kanidm";
    };
    sops.secrets."services/kanidm/idm-admin-password" = {
      owner = "kanidm";
    };
    sops.secrets."services/kanidm/oauth2-stalwart-secret" = {
      owner = "kanidm";
    };

    systemd.services.kanidm-generate-cert = {
      description = "Generate self-signed cert for kanidm";
      before = [ "kanidm.service" ];
      requiredBy = [ "kanidm.service" ];
      serviceConfig = {
        Type = "oneshot";
        RemainAfterExit = true;
        StateDirectory = "kanidm";
        StateDirectoryMode = "0700";
        User = "kanidm";
        Group = "kanidm";
      };
      script = ''
        if [ ! -f /var/lib/kanidm/chain.pem ]; then
          ${pkgs.openssl}/bin/openssl req -x509 -newkey rsa:4096 -nodes \
            -keyout /var/lib/kanidm/key.pem \
            -out /var/lib/kanidm/chain.pem \
            -days 3650 \
            -subj "/CN=kanidm"
        fi
      '';
    };

    services.kanidm = {
      package = pkgs.kanidmWithSecretProvisioning_1_10;
      server.enable = true;
      server.settings = {
        origin = "https://auth.chrayed.de";
        domain = "chrayed.de";
        bindaddress = "127.0.0.1:8443";
        tls_chain = "/var/lib/kanidm/chain.pem";
        tls_key = "/var/lib/kanidm/key.pem";
      };
      provision = {
        enable = true;
        groups.idm_all_persons = {};
        adminPasswordFile = config.sops.secrets."services/kanidm/admin-password".path;
        idmAdminPasswordFile = config.sops.secrets."services/kanidm/idm-admin-password".path;
        systems.oauth2.stalwart = {
          displayName = "Stalwart Mail";
          originUrl = "https://mailadmin.chrayed.de/auth/callback";
          originLanding = "https://mailadmin.chrayed.de";
          basicSecretFile = config.sops.secrets."services/kanidm/oauth2-stalwart-secret".path;
          scopeMaps."idm_all_persons" = [ "openid" "profile" "email" "groups" ];
        };
      };
    };

    services.caddy.virtualHosts."auth.chrayed.de" = {
      extraConfig = ''
        reverse_proxy https://127.0.0.1:8443 {
          transport http {
            tls_insecure_skip_verify
          }
        }
      '';
    };
  };
}

{ ... }: {
  flake.nixosModules.services-sys-authelia = { config, ... }: {
    sops.secrets."services/authelia/jwt-secret" = {};
    sops.secrets."services/authelia/storage-encryption-key" = {};
    sops.secrets."services/lldap/admin-password" = {};

    services.caddy.virtualHosts."auth.chrayed.de" = {
      extraConfig = ''
        reverse_proxy localhost:9091
      '';
    };

    containers.authelia = {
      autoStart = true;
      privateNetwork = false;

      bindMounts = {
        "/run/secrets/authelia-jwt-secret" = {
          hostPath = config.sops.secrets."services/authelia/jwt-secret".path;
          isReadOnly = true;
        };
        "/run/secrets/authelia-storage-encryption-key" = {
          hostPath = config.sops.secrets."services/authelia/storage-encryption-key".path;
          isReadOnly = true;
        };
        "/run/secrets/lldap-admin-password" = {
          hostPath = config.sops.secrets."services/lldap/admin-password".path;
          isReadOnly = true;
        };
      };

      config = { ... }: {
        system.stateVersion = "26.05";

        services.authelia.instances.main = {
          enable = true;

          secrets = {
            jwtSecretFile = "/run/secrets/authelia-jwt-secret";
            storageEncryptionKeyFile = "/run/secrets/authelia-storage-encryption-key";
          };

          settings = {
            theme = "dark";
            default_2fa_method = "totp";
            server.address = "tcp://0.0.0.0:9091/";
            log.level = "info";
            #authentication_backend.ldap = {
            #  implementation = "lldap";
            #  address = "ldap://127.0.0.1:3890";
            #  base_dn = "dc=chrayed,dc=de";
            #  user = "uid=admin,ou=people,dc=chrayed,dc=de";
            #  password_file = "/run/secrets/lldap-admin-password";
            #};

            session = {
              name = "authelia_session";
              cookies = [
                {
                  domain = "chrayed.de";
                  authelia_url = "https://auth.chrayed.de";
                  default_redirection_url = "https://chrayed.de";
                }
              ];
            };

            storage.local.path = "/var/lib/authelia-main/db.sqlite3";

            notifier.filesystem.filename = "/var/lib/authelia-main/notification.txt";
          };
        };
        networking.firewall.allowedTCPPorts = [ 9091 ];
      };
    };
  };
}

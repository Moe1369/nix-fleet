{ ... }: {
  flake.nixosModules.services-sys-authelia = { config, ... }: {
    users.groups.lldap = {};
    users.users.lldap = {
      isSystemUser = true;
      group = "lldap";
   };

    sops.secrets."services/authelia/jwt-secret" = {
      owner = "authelia-main";
    };
    sops.secrets."services/authelia/session-secret" = {
      owner = "authelia-main";
    };
    sops.secrets."services/authelia/storage-encryption-key" = {
      owner = "authelia-main";
    };
    sops.secrets."services/authelia/lldap-jwt-secret" = {
      mode = "0440";
      group = "lldap";
    };
    sops.secrets."services/authelia/lldap-admin-password" = {
      owner = "authelia-main";
      mode = "0440";
      group = "lldap";
    };
    sops.secrets."services/authelia/lldap-user-password" = {
      owner = "authelia-main";
    };

    services.authelia.instances.main = {
      enable = true;
      secrets = {
        jwtSecretFile            = config.sops.secrets."services/authelia/jwt-secret".path;
        sessionSecretFile        = config.sops.secrets."services/authelia/session-secret".path;
        storageEncryptionKeyFile = config.sops.secrets."services/authelia/storage-encryption-key".path;
      };
      settings = {
        theme = "auto";
        default_2fa_method = "totp";
        server.address = "tcp://127.0.0.1:9091/";
        log = {
          level = "info";
          format = "text";
        };
        authentication_backend.ldap = {
          implementation = "custom";
          address = "ldap://127.0.0.1:3890";
          base_dn = "dc=chrayed,dc=de";
          username_attribute = "uid";
          additional_users_dn = "ou=people";
          users_filter = "(&({username_attribute}={input})(objectClass=person))";
          additional_groups_dn = "ou=groups";
          groups_filter = "(&(member={dn})(objectClass=groupOfUniqueNames))";
          group_name_attribute = "cn";
          mail_attribute = "mail";
          display_name_attribute = "displayName";
          user = "uid=admin,ou=people,dc=chrayed,dc=de";
        };
        session = {
          name = "authelia_session";
          domain = "auth.chrayed.de";
          expiration = "1h";
          inactivity = "5m";
          remember_me_duration = "1M";
        };
        regulation = {
          max_retries = 3;
          find_time = "2m";
          ban_time = "5m";
        };
        storage.local = {
          path = "/var/lib/authelia-main/db.sqlite3";
        };
        notifier.filesystem = {
          filename = "/var/lib/authelia-main/notifications.txt";
        };
        access_control = {
          default_policy = "deny";
          rules = [
            {
              domain = "auth.chrayed.de";
              policy = "bypass";
            }
            {
              domain = "*.chrayed.de";
              policy = "two_factor";
            }
          ];
        };
      };
      environmentVariables = {
        AUTHELIA_AUTHENTICATION_BACKEND_LDAP_PASSWORD_FILE =
          config.sops.secrets."services/authelia/lldap-admin-password".path;
      };
    };

    services.lldap = {
      enable = true;
      settings = {
        http_port = 17170;
        ldap_port = 3890;
        ldap_host = "0.0.0.0";
        http_host = "127.0.0.1";
        ldap_base_dn = "dc=chrayed,dc=de";
        database_url = "sqlite:///var/lib/lldap/users.db?mode=rwc";
        jwt_secret_file = config.sops.secrets."services/authelia/lldap-jwt-secret".path;
        ldap_user_pass_file = config.sops.secrets."services/authelia/lldap-admin-password".path;
        force_ldap_user_pass_reset = "always";
      };
    };

    services.caddy = {
      virtualHosts = {
        "auth.chrayed.de" = {
          extraConfig = ''
            reverse_proxy localhost:17170
          '';
        };
      };
    };
  };
}

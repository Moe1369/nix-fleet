{ ... }: {
  flake.nixosModules.services-sys-stalwart = { config, ... }: {
    sops.secrets."services/stalwart/adminpass" = {
      owner = "stalwart-mail";
    };
    sops.secrets."services/stalwart/oauth-secret" = {
      owner = "stalwart-mail";
    };
    services.stalwart = {
      stateVersion = "2.0";
      enable = true;
      credentials = {
        "admin" = "%{file:${config.sops.secrets."services/stalwart/adminpass".path}}%";
      };
      settings = {
        server.url = "https://mailadmin.chrayed.de";
        server.http.allowed-hosts = [ "mailadmin.chrayed.de" ];
        server.http.cors.allowed-origins = [ "https://mail.chrayed.de" ];
        server.http.permissive-cors = true;

        authentication.fallback-admin = {
          user = "admin";
          secret = "%{file:${config.sops.secrets."services/stalwart/adminpass".path}}%";
        };

        oauth.client.bulwark = {
          name          = "Bulwark Webmail";
          secret        = "%{file:${config.sops.secrets."services/stalwart/oauth-secret".path}}%";
          redirect-uris = [ "https://mail.chrayed.de/auth/callback" ];
          grants        = [ "authorization_code" "refresh_token" ];
        };

        server.listener = {
          smtp = {
            bind     = [ "0.0.0.0:25" ];
            protocol = "smtp";
          };
          submission = {
            bind     = [ "0.0.0.0:587" ];
            protocol = "smtp";
          };
          submissions = {
            bind         = [ "0.0.0.0:465" ];
            protocol     = "smtp";
            tls.implicit = true;
          };
          imap = {
            bind     = [ "0.0.0.0:143" ];
            protocol = "imap";
          };
          imaps = {
            bind         = [ "0.0.0.0:993" ];
            protocol     = "imap";
            tls.implicit = true;
          };
          http = {
            bind     = [ "127.0.0.1:8080" ];
            protocol = "http";
          };
        };

        storage.data   = "rocksdb";
        storage.fts    = "rocksdb";
        storage.blob   = "rocksdb";
        storage.lookup = "rocksdb";
        store.rocksdb  = {
          type        = "rocksdb";
          path        = "/var/lib/stalwart-mail/data";
          compression = "lz4";
        };
      };
    };

    networking.firewall.allowedTCPPorts = [ 25 465 587 143 993 ];
  };
}

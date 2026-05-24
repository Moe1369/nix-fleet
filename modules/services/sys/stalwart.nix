{ ... }: {
  flake.nixosModules.services-sys-stalwart = { config, ... }: {
    sops.secrets."services/stalwart/adminpass" = {
      owner = "stalwart-mail";
    };

    services.stalwart-mail = {
      stateVersion = "2.0";
      enable = true;
      settings = {
        server.listener = {
          smtp = {
            bind = [ "0.0.0.0:25" ];
            protocol = "smtp";
          };
          submission = {
            bind = [ "0.0.0.0:587" ];
            protocol = "smtp";
          };
          submissions = {
            bind = [ "0.0.0.0:465" ];
            protocol = "smtp";
            tls.implicit = true;
          };
          imap = {
            bind = [ "0.0.0.0:143" ];
            protocol = "imap";
          };
          imaps = {
            bind = [ "0.0.0.0:993" ];
            protocol = "imap";
            tls.implicit = true;
          };
          http = {
            bind = [ "127.0.0.1:8080" ];
            protocol = "http";
          };
        };

        storage.data = "rocksdb";
        storage.fts  = "rocksdb";
        storage.blob = "rocksdb";
        storage.lookup = "rocksdb";

        store.rocksdb = {
          type = "rocksdb";
          path = "/var/lib/stalwart-mail/data";
          compression = "lz4";
        };

        authentication.fallback-admin = {
          user = "admin";
          secret = "%{file:${config.sops.secrets."services/stalwart/adminpass".path}}%";
        };
      };
    };

    networking.firewall.allowedTCPPorts = [ 25 465 587 143 993 ];
  };
}

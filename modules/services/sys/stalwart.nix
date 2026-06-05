{
  description = "Stalwart Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    stalwart-src = {
      url = "github:stalwartlabs/stalwart/v0.16.4";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, stalwart-src, ... }@inputs: {
    nixosConfigurations.my-server = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ({ config, pkgs, ... }: {
          nixpkgs.overlays = [
            (final: prev: {
              stalwart = prev.stalwart.overrideAttrs (old: {
                src = stalwart-src;
                version = "0.16.4";
                cargoHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
              });
            })
          ];
        })

        ({ config, pkgs, lib, ... }: {
          sops.secrets."services/stalwart/adminpass" = { owner = "stalwart-mail"; };
          sops.secrets."services/stalwart/oauth-secret" = { owner = "stalwart-mail"; };

          systemd.services.stalwart.environment = {
            STALWART_PUBLIC_URL = "https://mailadmin.chrayed.de";
          };

          services.stalwart = {
            stateVersion = "2.0";
            enable = true;
            credentials = {
              "admin" = "%{file:${config.sops.secrets."services/stalwart/adminpass".path}}%";
            };
            settings = {
              server.http.use-x-forwarded = true;
              server.hostname = "mailadmin.chrayed.de";
              server.http.allowed-hosts = [ "mailadmin.chrayed.de" ];
              server.http.cors.allowed-origins = [ "https://mail.chrayed.de" ];
              server.http.permissive-cors = true;

              authentication.fallback-admin = {
                user = "admin";
                secret = "%{file:${config.sops.secrets."services/stalwart/adminpass".path}}%";
              };

              oauth.client.bulwark = {
                name = "Bulwark Webmail";
                secret = "%{file:${config.sops.secrets."services/stalwart/oauth-secret".path}}%";
                redirect-uris = [ "https://mail.chrayed.de/auth/callback" ];
                grants = [ "authorization_code" "refresh_token" ];
              };

              server.listener = {
                smtp = { bind = [ "0.0.0.0:25" ]; protocol = "smtp"; };
                submission = { bind = [ "0.0.0.0:587" ]; protocol = "smtp"; };
                submissions = { bind = [ "0.0.0.0:465" ]; protocol = "smtp"; tls.implicit = true; };
                imap = { bind = [ "0.0.0.0:143" ]; protocol = "imap"; };
                imaps = { bind = [ "0.0.0.0:993" ]; protocol = "imap"; tls.implicit = true; };
                jmap = { bind = "[::]:8081"; protocol = "http"; };
                management = { bind = [ "127.0.0.1:8080" ]; protocol = "http"; };
              };

              storage.data = "rocksdb";
              storage.fts = "rocksdb";
              storage.blob = "rocksdb";
              storage.lookup = "rocksdb";
              store.rocksdb = {
                type = "rocksdb";
                path = "/var/lib/stalwart-mail/data";
                compression = "lz4";
              };
            };
          };

          services.caddy.virtualHosts."mailadmin.chrayed.de" = {
            extraConfig = ''
              reverse_proxy localhost:8080
            '';
          };

          networking.firewall.allowedTCPPorts = [ 25 465 587 143 993 ];
        })
      ];
    };
  };
}

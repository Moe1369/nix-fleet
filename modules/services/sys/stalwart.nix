{ ... }: {
  flake.nixosModules.services-sys-stalwart = { config, lib, ... }: {

    virtualisation.oci-containers.containers."stalwart-mail" = {
      image = "stalwartlabs/stalwart:v0.16.7";
      environment = {
        STALWART_PUBLIC_URL = "https://mail.chrayed.de";
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
        "stalwart-data:/var/lib/stalwart"
        "stalwart-etc:/etc/stalwart"
      ];
    };
    services.caddy.virtualHosts."mail.chrayed.de" = {
      extraConfig = ''
        reverse_proxy localhost:8080
      '';
    };
    networking.firewall.allowedTCPPorts = [ 25 465 587 143 993 ];
  };
}

{ ... }: {
  flake.nixosModules.platform-sys-cache = { config, ... }: {
    sops.secrets."garnix/token" = {
      path = "/etc/nix/netrc";
      mode = "0400";
    };
#    nix.settings = {
#      substituters = [ "https://cache.garnix.io" ];
#      trusted-public-keys = [ "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g=" ];
#      netrc-file = "/etc/nix/netrc";
#    };
    nix.settings = {
      substituters = [ "ssh://eu.nixbuild.net" ];
      trusted-public-keys = [ "nixbuild.net/4HVEBQ-1:SmBTIoPfsqu9rIAyXcg90ZTkytGdxq2iOHVgjfXn+A8=" ];
    };
    nix.extraOptions = ''
      narinfo-cache-positive-ttl = 3600
    '';
  };
}

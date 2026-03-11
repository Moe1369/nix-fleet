{ ... }: {
  flake.nixosModules.platform-sys-cache = { config, ... }: {
    sops.secrets."garnix/token" = {
      path = "/etc/nix/netrc";
      mode = "0400";
    };
    nix.settings = {
      substituters = [ "https://cache.garnix.io" ];
      trusted-public-keys = [ "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g=" ];
      netrc-file = "/etc/nix/netrc";
    };
    nix.extraOptions = ''
      narinfo-cache-positive-ttl = 3600
    '';
  };
}

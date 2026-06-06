{ ... }: {
  flake.nixosModules.platform-sys-cache = { config, ... }: {
    sops.secrets."ssh/nixbuild/public" = {
      path = "/root/.ssh/nixbuild.pub";
      mode = "0400";
      owner = "root";
    };
    sops.secrets."ssh/nixbuild/known-hosts" = {
      mode = "0444";
    };
    sops.secrets."ssh/nixbuild/private" = {
      path = "/root/.ssh/nixbuild";
      mode = "0400";
      owner = "root";
    };
    programs.ssh.extraConfig = ''
      Host eu.nixbuild.net
        IdentityFile /root/.ssh/nixbuild
        PubkeyAcceptedKeyTypes ssh-ed25519
        ServerAliveInterval 60
        IPQoS throughput
    '';
    system.activationScripts.nixbuildKnownHost = {
      deps = [ "setupSecrets" ];
      text = ''
        known=$(cat ${config.sops.secrets."ssh/nixbuild/known-hosts".path})
        grep -qF "eu.nixbuild.net" /root/.ssh/known_hosts 2>/dev/null || \
          echo "eu.nixbuild.net $known" >> /root/.ssh/known_hosts
      '';
    };
    nix = {
      settings = {
        substituters = [
          "ssh://eu.nixbuild.net"
        ];
        trusted-public-keys = [
          "nixbuild.net/4HVEBQ-1:SmBTIoPfsqu9rIAyXcg90ZTkytGdxq2iOHVgjfXn+A8="
        ];
      };
      extraOptions = ''
        narinfo-cache-positive-ttl = 3600
      '';
    };
  };
}

{ inputs, ... }: {
  flake.nixosModules.security-sys-sopsnix = { config, pkgs, ... }: {
    imports = [ inputs.sops-nix.nixosModules.sops ];
    environment.systemPackages = [ pkgs.age pkgs.sops ];
    sops.defaultSopsFile = ../secrets/secrets.yaml;
    systemd.tmpfiles.rules = [
      "d /var/lib/sops/root-keys 0700 root root -"
     ];
  };
}

{ inputs, ... }: {
  flake.homeModules.security-usr-sopsnix = { config, pkgs, ... }: {
    imports = [ inputs.sops-nix.homeManagerModules.sops ];
#    sops.age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";
    sops.age.keyFile = "/var/lib/sops/user-keys/master-user.txt";
    sops.defaultSopsFile = ../secrets/secrets.yaml;
  };
}

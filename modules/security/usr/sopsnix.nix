{ inputs, ... }: {
  flake.homeModules.security-usr-sopsnix = { config, pkgs, ... }: {
    imports = [ inputs.sops-nix.homeManagerModules.sops ];
    sops.age.keyFile = "/home/mo/.config/sops/age/keys.txt";
    sops.defaultSopsFile = ../secrets/secrets.yaml;
  };
}

{ inputs, ... }: {
  flake.homeModules.security-usr-sopsnix = { config, pkgs, ... }: {
    imports = [ inputs.sops-nix.homeManagerModules.sops ];
    sops.defaultSopsFile = ../secrets/secrets.yaml;
  };
}

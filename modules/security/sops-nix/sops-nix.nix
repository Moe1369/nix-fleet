{ inputs, ... }: {
  flake.nixosModules.sops-nix = { pkgs, ... }: {
    imports = [ inputs.sops-nix.nixosModules.sops ];

    environment.systemPackages = [ pkgs.age pkgs.sops ];

    sops.defaultSopsFile = ./secrets/secrets.yaml;
  };
}

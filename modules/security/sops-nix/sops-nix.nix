{ inputs, ... }: {
  flake.nixosModules.sops-nix = { ... }: {
    imports = [
      inputs.sops-nix.nixosModules.sops
    ];
  };
}

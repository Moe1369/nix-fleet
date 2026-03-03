{ inputs, ... }: {
  flake.nixosConfigurations.computer-mo = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    specialArgs = { user = "mo"; };
    modules = [
      inputs.self.nixosModules.computer-mo
    ];
  };
}

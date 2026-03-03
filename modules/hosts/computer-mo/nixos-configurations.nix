{ inputs, ... }: {
  flake.nixosConfigurations.computer-mo = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    specialArgs = {
      user = "mo";
      pkgs-unstable = import inputs.nixpkgs-unstable {
        system = "x86_64-linux";
        config.allowUnfree = true;
      };
    };
    modules = [
      inputs.self.nixosModules.computer-mo
    ];
  };
}

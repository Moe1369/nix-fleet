{ inputs, ... }: {
  flake.nixosConfigurations."computer-mo" = inputs.self.lib.mkHost {
    system = "x86_64-linux";
    host   = "computer-mo";
  };
}

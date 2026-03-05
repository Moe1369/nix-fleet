{ inputs, ... }: {
  flake.nixosConfigurations."deck" = inputs.self.lib.mkHost {
    system = "x86_64-linux";
    host   = "deck";
  };
}

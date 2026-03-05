{ inputs, ... }: {
  flake.nixosConfigurations."computer-deck" = inputs.self.lib.mkHost {
    system = "x86_64-linux";
    host   = "computer-deck";
  };
}

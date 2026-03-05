{ inputs, ... }: {
  flake.nixosConfigurations."computer-nadine" = inputs.self.lib.mkHost {
    system = "x86_64-linux";
    host   = "computer-nadine";
  };
}

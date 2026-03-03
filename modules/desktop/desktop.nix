{ inputs, ... }: {
  flake.nixosModules.desktop = {
    imports = with inputs.self.nixosModules; [
      bluetooth
      fonts
      gpu-amd
      input
      printing
      sound
    ];
  };
}

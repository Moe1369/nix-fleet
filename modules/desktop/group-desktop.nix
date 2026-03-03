{ inputs, ... }: {
  flake.nixosModules.desktop-sys-group = {
    imports = with inputs.self.nixosModules; [
      desktop-sys-bluetooth
      desktop-sys-fonts
      desktop-sys-gpu-amd
      desktop-sys-input
      desktop-sys-printing
      desktop-sys-sound
      desktop-sys-miscapps
    ];
  };
}

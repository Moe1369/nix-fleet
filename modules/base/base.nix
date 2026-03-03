{ inputs, ... }: {
  flake.nixosModules.base = {
    imports = with inputs.self.nixosModules; [
      boot
      firmware
      locale
      networking
      security
      shellapps
      version
      zsh
    ];
  };
}

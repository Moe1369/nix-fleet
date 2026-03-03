{ ... }: {
  flake.nixosModules.desktop-sys-printing = {
    services.printing.enable = true;
  };
}

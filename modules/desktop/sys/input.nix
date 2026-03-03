{ ... }: {
  flake.nixosModules.desktop-sys-input = {
    services.libinput.enable = true;
  };
}

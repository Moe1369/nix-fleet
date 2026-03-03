{ ... }: {
  flake.nixosModules.base-sys-rtkit = {
    security.rtkit.enable = true;
  };
}

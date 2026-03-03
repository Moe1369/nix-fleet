{ ... }: {
  flake.nixosModules.base-sys-version = {
   system.stateVersion = "25.11";
  };
}

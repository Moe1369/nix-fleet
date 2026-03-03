{ inputs, ... }: {
  flake.lib.mkHost = { system ? "x86_64-linux", user, extraModules ? [] }:
    inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit user;
        pkgs-unstable = import inputs.nixpkgs-unstable {
          inherit system;
          config.allowUnfree = true;
        };
      };
      modules = extraModules;
    };
}

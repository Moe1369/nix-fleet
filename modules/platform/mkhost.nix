{ inputs, ... }: {
  flake.lib.mkHost = { system, user, host, extraModules ? [] }:
    inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit user host;
        pkgs-unstable = import inputs.nixpkgs-unstable {
          inherit system;
          config.allowUnfree = true;
        };
      };
      modules = extraModules;
    };
}

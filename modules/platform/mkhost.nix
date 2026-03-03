{ inputs, ... }: {
  flake.lib.mkHost = { system, host, extraModules ? [] }:
    inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit host system;
        pkgs-unstable = import inputs.nixpkgs-unstable {
          inherit system;
          config.allowUnfree = true;
        };
      };
      modules = [ inputs.self.nixosModules.${host} ] ++ extraModules;
    };
}

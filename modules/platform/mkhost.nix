{ inputs, ... }: {
  flake.lib.mkHost = { system, host, extraModules ? [] }:
    inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit inputs host system;
      };
      modules = [ inputs.self.nixosModules.${host} ] ++ extraModules;
    };
}

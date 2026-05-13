{ inputs, ... }: {
  flake.lib.mkHost = { system, host, user, extraModules ? [] }:
    inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit inputs host system user;
      };
      modules = [ inputs.self.nixosModules.${host} ] ++ extraModules;
    };
}

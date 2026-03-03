{ inputs, ... }:
let
  system = "x86_64-linux";
  user   = "mo";
  host   = "computer-mo";

  mkHost = inputs.self.lib.mkHost;
in
{
  flake.nixosConfigurations.${host} = mkHost {
    inherit system user host;
    extraModules = [ inputs.self.nixosModules.${host} ];
  };
}

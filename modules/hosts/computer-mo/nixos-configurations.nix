{ inputs, ... }:
let
  mkHost = inputs.self.lib.mkHost;
in
{
  flake.nixosConfigurations = {
    computer-mo = mkHost {
      user = "mo";
      extraModules = [ inputs.self.nixosModules.computer-mo ];
    };
  };
}

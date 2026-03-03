{ inputs, ... }: {
  flake.lib.mkHost = { system, user, host, extraModules ? [] }:
    let
      fullnames = {
        mo            = "Mohamed Chrayed";
        nadine        = "Nadine Peukert";
        administrator = "Administrator";
      };
    in
    inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit user host;
        fullname = fullnames.${user};
        pkgs-unstable = import inputs.nixpkgs-unstable {
          inherit system;
          config.allowUnfree = true;
        };
      };
      modules = extraModules;
    };
}

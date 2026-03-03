{ inputs, ... }: {
  systems = [
    "x86_64-linux"
  ];

  perSystem = { system, ... }: {
    _module.args.pkgs = import inputs.nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };

    _module.args.pkgs-unstable = import inputs.nixpkgs-unstable {
      inherit system; 
      config.allowUnfree = true;
    };
  };
  
  flake.nixosModules.nix-settings = {
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
  };
}

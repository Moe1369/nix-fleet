{ inputs, ... }: {
  config = {
    systems = [
      "aarch64-linux"
      "x86_64-linux"
    ];

    perSystem = { pkgs, system, ... }: {
      _module.args.pkgs = import inputs.nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      
      _module.args.pkgs-unstable = import inputs.nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
    };
  };
}

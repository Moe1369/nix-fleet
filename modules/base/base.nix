{ inputs, config, ... }: {
  flake.nixosModules.base = {
    imports = with inputs.self.nixosModules; [
      boot
      firmware
      home-manager
      locale
      network
      nix-settings
      rtkit
      shellapps
      user
      version
      zsh
    ];
  };

  flake.homeModules.base = { ... }: {
    imports = with config.flake.homeModules; [
      git
      zsh
    ];
  };
}

{ inputs, config, ... }: {
  flake.nixosModules.base = {
    imports = with inputs.self.nixosModules; [
      boot
      firmware
      home-manager
      locale
      network
      nix-settings
      security
      shellapps
      user
      version
      zsh
    ];
  };

  flake.homeManagerModules.base = { ... }: {
    imports = with config.flake.homeManagerModules; [
      git
      zsh
    ];
  };
}

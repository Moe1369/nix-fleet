{ inputs, config, ... }: {
  flake.nixosModules.computer-mo = { user, ... }: {
    imports = with inputs.self.nixosModules; [
      base
      desktop
      singledisk
      gdm
      gnome-apps
      gnome
      brave
      1password
    ];

    home-manager.users.${user}.imports = with config.flake.homeModules; [
      gnome
      base
    ];
  };
}

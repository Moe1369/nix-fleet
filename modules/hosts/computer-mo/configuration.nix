{ inputs, config, user, ... }: {
  flake.nixosModules.computer-mo = {
    imports = with inputs.self.nixosModules; [
      base
      desktop
      singledisk
      gdm
      gnome-apps
      gnome
      mo
    ];

    home-manager.users.${user}.imports = with config.flake.homeManagerModules; [
      gnome-settings
    ];
  };
}

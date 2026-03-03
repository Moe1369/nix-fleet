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
      onepassword
      steam
      lact
    ];

    home-manager.users.${user}.imports = with config.flake.homeModules; [
      gnome
      base
    ];
  };
}

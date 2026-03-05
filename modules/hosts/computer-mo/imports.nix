{ inputs, config, ... }: {
  flake.nixosModules.computer-mo = { ... }: {
    imports = with inputs.self.nixosModules; [
      apps-sys-brave
      apps-sys-onepassword
      apps-sys-teams
      base-sys-group
      desktop-sys-group
      disks-sys-singledisk
      gaming-sys-controller
      gaming-sys-lact
      gaming-sys-steam
      gnome-sys-gdm
      gnome-sys-gdm-mo
      gnome-sys-gnome
      gnome-sys-gnome-apps
      security-sys-secureboot
      security-sys-sopsnix
      users-sys-mo
    ];
    home-manager.users.mo.imports = with config.flake.homeModules; [
      base-usr-group
      gnome-usr-gnome-mo
      security-usr-sopsnix
    ];
  };
}

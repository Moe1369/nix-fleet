{ inputs, config, ... }: {
  flake.nixosModules.computer-mo = { ... }: {
    imports = with inputs.self.nixosModules; [
      mo
      base-sys-group
      apps-sys-brave
      gaming-sys-controller
      desktop-sys-group
      gnome-sys-gdm
      gnome-sys-gdm-mo
      gnome-sys-gnome
      gnome-sys-gnome-apps
      gaming-sys-lact
      apps-sys-onepassword
      security-sys-secureboot
      disks-sys-singledisk
      security-sys-sopsnix
      gaming-sys-steam
    ];
    home-manager.users.mo.imports = with config.flake.homeModules; [
      base-usr-group
      gnome-usr-gnome-mo
    ];
  };
}

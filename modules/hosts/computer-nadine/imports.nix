{ inputs, config, ... }: {
  flake.nixosModules.computer-nadine = { ... }: {
    imports = with inputs.self.nixosModules; [
      apps-sys-chrome
      apps-sys-vesktop
      base-sys-group
      desktop-sys-group
      disks-sys-singledisk
      gaming-sys-controller
      gaming-sys-lact
      gaming-sys-steam
      gnome-sys-gdm
      gnome-sys-gdm-nadine
      gnome-sys-gnome
      gnome-sys-gnome-apps
      security-sys-secureboot
      security-sys-sopsnix
      users-sys-nadine
    ];
    home-manager.users.nadine.imports = with config.flake.homeModules; [
      apps-usr-vesktop-all
      base-usr-group
      gaming-usr-steam-all
      gnome-usr-gnome-nadine
      security-usr-sopsnix
    ];
  };
}

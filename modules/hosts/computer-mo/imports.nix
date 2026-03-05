{ inputs, config, ... }: {
  flake.nixosModules.computer-mo = { ... }: {
    imports = with inputs.self.nixosModules; [
      apps-sys-brave
      apps-sys-onepassword
      apps-sys-teams
      apps-sys-vesktop
      base-sys-group
      desktop-sys-group
      disks-sys-singledisk
      gaming-sys-controller
      gaming-sys-lact
      gaming-sys-nexusmods
      gaming-sys-osu
      gaming-sys-steam
      gnome-sys-gdm
      gnome-sys-gdm-mo
      gnome-sys-gnome
      gnome-sys-gnome-apps
      security-sys-secureboot
      security-sys-sopsnix
      users-sys-mo
      hypervisor-sys-virtualization
    ];
    home-manager.users.mo.imports = with config.flake.homeModules; [
      apps-usr-onepassword-all
      apps-usr-vesktop-all
      base-usr-group
      gaming-usr-steam-all
      gnome-usr-gnome-mo
      security-usr-sopsnix
    ];
  };
}

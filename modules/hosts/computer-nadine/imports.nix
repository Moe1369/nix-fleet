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
      security-sys-secureboot
      security-sys-sopsnix
      users-sys-nadine
    ];
    home-manager.users.nadine.imports = with config.flake.homeModules; [
      apps-usr-vesktop-all
      base-usr-group
      gaming-usr-steam-all
      security-usr-sopsnix
    ];
  };
}

{ inputs, config, ... }: {
  flake.nixosModules.computer-deck = { ... }: {
    imports = with inputs.self.nixosModules; [
      apps-sys-chrome
      apps-sys-vesktop
      base-sys-group
      desktop-sys-group
      disks-sys-singledisk
      gaming-sys-controller
      gaming-sys-jovian
      kde-sys-plasma
      kde-sys-plasma-apps
      kde-sys-sddm-deck
      security-sys-secureboot
      security-sys-sopsnix
      users-sys-deck
    ];
    home-manager.users.deck.imports = with config.flake.homeModules; [
      apps-usr-vesktop-all
      base-usr-group
      gaming-usr-steam-all
      kde-usr-plasma-deck
      security-usr-sopsnix
    ];
  };
}

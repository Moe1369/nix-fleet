{ inputs, config, ... }: {
  flake.nixosModules.computer-mo = { ... }: {
    imports = with inputs.self.nixosModules; [
      base
      desktop
      singledisk
      gdm
      gdm-mo
      gnome-apps
      gnome
      brave
      onepassword
      steam
      lact
      secure-boot
      sops-nix
      mo
    ];

    home-manager.users.mo.imports = with config.flake.homeModules; [
      gnome
      base
    ];
  };
}

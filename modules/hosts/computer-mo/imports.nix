{ inputs, config, ... }: {
  flake.nixosModules.computer-mo = { ... }: {
    imports = with inputs.self.nixosModules; [
      base
      brave
      controller
      desktop
      gdm
      gdm-mo
      gnome
      gnome-apps
      lact
      mo
      onepassword
      secure-boot
      singledisk
      sops-nix
      steam
    ];
    home-manager.users.mo.imports = with config.flake.homeModules; [
      base
      gnome-mo
    ];
  };
}

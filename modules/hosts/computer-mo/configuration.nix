{ inputs, ...}:
{
  flake.nixosModules.computer-mo = {
    imports = with inputs.self.modules.nixos; [
      base
      gnome
      gnome-apps
      steam
      overclocking
    ];
  };
}

{ inputs, ...}:
{
  flake.nixosModules.computer-mo = {
    imports = with inputs.self.nixosModules; [
      base
      desktop
      singledisk
      gdm
      gnome-apps
      gnome
      mo
    ];
  };
}

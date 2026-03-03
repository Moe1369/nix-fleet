{ inputs, ...}:
{
  flake.nixosModules.computer-mo = {
    imports = with inputs.self.nixosModules; [
      base
      home-manager
      nix-settings
    ];
  };
}

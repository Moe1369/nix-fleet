{ inputs, ...}:
{
  flake.nixosModules.computer-mo = {
    imports = with inputs.self.modules.nixos; [
      base
      home-manager
    ];
  };
}

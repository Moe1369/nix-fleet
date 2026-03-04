{ inputs, config, ... }:
{
  flake.nixosModules.base-sys-hm = {
    imports = [
      inputs.home-manager.nixosModules.home-manager
      inputs.sops-nix.homeManagerModules.sops
      (
        { lib, ... }:
        {
          home-manager = {
            verbose = true;
            useUserPackages = true;
            useGlobalPkgs = true;
            backupFileExtension = "backup";
            backupCommand = "rm";
            overwriteBackup = true;
          };
        }
      )
    ];
  };
}

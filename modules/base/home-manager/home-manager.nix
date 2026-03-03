{ inputs, config, ... }:
{
  flake.nixosModules.home-manager = {
    imports = [
      inputs.home-manager.nixosModules.home-manager
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

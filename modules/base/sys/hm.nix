{ inputs, config, ... }:
{
  flake.nixosModules.base-sys-hm = {
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

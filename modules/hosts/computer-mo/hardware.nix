{
  flake.nixosModules.computer-mo = {
    boot.kernelModules = [ "" ];
    boot.extraModulePackages = [ ];
    nixpkgs.hostPlatform = "x86_64-linux";
    hardware.cpu.amd.updateMicrocode = true;
  };
}

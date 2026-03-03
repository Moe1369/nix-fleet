{ ... }: {
  flake.nixosModules.gaming-sys-lact = {
   services.lact.enable = true;
   hardware.amdgpu.overdrive.enable = true;
  };
}

{ ... }: {
  flake.nixosModules.desktop-sys-gpu-amd = { pkgs, ... }: {
    boot.initrd.kernelModules = [ "amdgpu" ];
    boot.kernelModules = [ "amdgpu" ];

    hardware.amdgpu.initrd.enable = true;
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };

    environment.systemPackages = with pkgs; [
      vulkan-tools
    ];
  };
}

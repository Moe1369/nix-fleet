{ ... }: {
  flake.nixosModules.gaming-sys-steam = { pkgs-unstable, ... }: {
    programs.steam = {
      enable = true;
      extest.enable = true;
      package = pkgs-unstable.steam.override {
        extraEnv = {
          GAMEMODERUN = "1";
          PROTON_ENABLE_HDR = "1";
          PROTON_FSR4_UPGRADE = "1";
          DXIL_SPIRV_CONFIG = "wmma_rdna3_workaround"; 
         };
       };
      extraCompatPackages = with pkgs-unstable; [
        proton-ge-bin
      ];
      extraPackages = with pkgs-unstable; [
        gamescope
        mangohud
      ];
    };
  };
}

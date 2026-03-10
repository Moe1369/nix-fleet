{ ... }: {
  flake.nixosModules.gaming-sys-steam = { pkgs, ... }: {
    programs.steam = {
      enable = true;
      extest.enable = true;
      package = pkgs.steam.override {
        extraEnv = {
          GAMEMODERUN = "1";
          PROTON_ENABLE_WAYLAND = "1";
          PROTON_ENABLE_HDR = "1";
          PROTON_FSR4_UPGRADE = "1";
          DXIL_SPIRV_CONFIG = "wmma_rdna3_workaround"; 
         };
       };
      extraCompatPackages = with pkgs; [
        proton-ge-bin
        gamescope
        mangohud
      ];
    };
  };
}

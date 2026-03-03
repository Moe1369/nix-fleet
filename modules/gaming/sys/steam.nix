{ ... }: {
  flake.nixosModules.gaming-sys-steam = { pkgs-unstable, ... }: {
    programs.steam = {
      enable = true;
      extest.enable = true;
      
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

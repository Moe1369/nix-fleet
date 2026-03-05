{ ... }: {
  flake.nixosModules.gaming-sys-osu = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      osu-lazer-bin
    ];
  };
}

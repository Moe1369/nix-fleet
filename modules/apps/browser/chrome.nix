{ ... }: {
  flake.nixosModules.chrome = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      chrome
    ];
  };
}

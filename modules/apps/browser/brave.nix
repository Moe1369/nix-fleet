{ ... }: {
  flake.nixosModules.brave = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      brave
    ];
  };
}

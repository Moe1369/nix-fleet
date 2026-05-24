{ ... }: {
  flake.nixosModules.apps-sys-ladybird = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      ladybird
    ];
  };
}

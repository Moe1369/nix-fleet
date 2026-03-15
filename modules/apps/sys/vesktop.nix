{ ... }: {
  flake.nixosModules.apps-sys-vesktop = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      vesktop
    ];
  };
}

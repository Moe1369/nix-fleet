{ ... }: {
  flake.nixosModules.apps-sys-vesktop-all = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      vesktop
    ];
  };
}

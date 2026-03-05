{ ... }: {
  flake.nixosModules.apps-sys-teams = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      teams-for-linux
    ];
  };
}

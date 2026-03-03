{ ... }: {
  flake.nixosModules.apps-sys-chrome = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      chrome
    ];
  };
}

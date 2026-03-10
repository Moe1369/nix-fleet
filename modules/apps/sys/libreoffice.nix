{ ... }: {
  flake.nixosModules.apps-sys-libreoffice = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      libreoffice-fresh
    ];
  };
}

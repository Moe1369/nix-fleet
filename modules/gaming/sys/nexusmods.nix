{ ... }: {
  flake.nixosModules.gaming-sys-nexusmods = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      nexusmods-app
      (pkgs.nexusmods-app.override {
        _7zz = pkgs._7zz-rar;
      })
    ];
  };
}

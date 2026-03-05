{ ... }: {
  flake.nixosModules.gaming-sys-nexusmods = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      nexusmods-app-unfree
    ];
  };
}

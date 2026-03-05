{ ... }: {
  flake.nixosModules.gaming-sys-nexusmods = { pkgs, ... }: {
    nixpkgs.config.permittedInsecurePackages = [
      "nexusmods-app-unfree-0.21.1"
    ];

    environment.systemPackages = with pkgs; [
      nexusmods-app-unfree
    ];
  };
}

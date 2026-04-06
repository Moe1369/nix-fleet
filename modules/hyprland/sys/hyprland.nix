{ inputs, ... }: {
  flake.nixosModules.hyprland-sys-hyprland = { pkgs, ... }: {
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
      withSystemd = true;
      withUWSM = true;
    };

    environment.systemPackages = [
      inputs.caelestia-shell.packages.${pkgs.stdenv.hostPlatform.system}.with-cli
    ];
  };
}

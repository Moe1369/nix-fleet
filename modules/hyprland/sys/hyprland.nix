{ inputs, ... }: {
  flake.nixosModules.hyprland-sys-hyprland = { pkgs, ... }: let
    tuigreet = "${pkgs.greetd.tuigreet}/bin/tuigreet";
    session   = "${pkgs.hyprland}/bin/Hyprland";
    username  = "mo";
  in {
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
      withUWSM = true;
    };

    services.greetd = {
      enable = true;
      settings = {
        initial_session = {
          command = session;
          user    = username;
        };
        default_session = {
          command = "${tuigreet} --greeting 'Welcome to NixOS!' --asterisks --remember --remember-user-session --time --cmd ${session}";
          user    = "mo";
        };
      };
    };

    environment.systemPackages = [
      inputs.caelestia-shell.packages.${pkgs.stdenv.hostPlatform.system}.with-cli
    ];
  };
}

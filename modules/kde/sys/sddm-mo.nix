{ ... }: {
  flake.nixosModules.kde-sys-sddm-mo = { pkgs, ... }: {
    services.displayManager =  {
      sddm.wayland.enable = true;
      sddm.enable = true;
      autoLogin.enable = true;
      autoLogin.user = "mo";
    };
  };
}

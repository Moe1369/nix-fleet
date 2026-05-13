{ ... }: {
  flake.nixosModules.kde-sys-sddm = { pkgs, user, ... }: {
    services.displayManager =  {
      sddm.wayland.enable = true;
      sddm.enable = true;
      autoLogin.enable = true;
      autoLogin.user = user;
    };
  };
}

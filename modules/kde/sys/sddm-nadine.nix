{ ... }: {
  flake.nixosModules.kde-sys-sddm-nadine = { pkgs, ... }: {
    services.displayManager =  {
      sddm.wayland.enable = true;
      sddm.enable = true;
      autoLogin.enable = true;
      autoLogin.user = "nadine";
    };
  };
}

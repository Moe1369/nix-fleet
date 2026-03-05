{ ... }: {
  flake.nixosModules.kde-sys-sddm-deck = { pkgs, ... }: {
    services.displayManager =  {
      sddm.wayland.enable = true;
      sddm.enable = true;
      autoLogin.enable = true;
      autoLogin.user = "deck";
    };
  };
}

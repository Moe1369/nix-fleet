{ ... }: {
  flake.nixosModules.desktop-sys-sound = { ... }: {
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
}

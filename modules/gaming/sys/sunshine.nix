{ ... }: {
  flake.nixosModules.gaming-sys-sunshine = { pkgs, ... }: {
    services.sunshine = {
      enable = true;
      autoStart = true;
      capSysAdmin = true;
      openFirewall = true;
    };
  };
}

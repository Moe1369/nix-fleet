{ ... }: {
  flake.nixosModules.base-sys-sshd = { config, ... }: {
    services.openssh.enable = true;
  };
}

{ ... }: {
  flake.nixosModules.sshd = { config, ... }: {
    services.openssh.enable = true;
  };
}

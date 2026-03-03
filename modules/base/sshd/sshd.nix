{ ... }: {
  flake.nixosModules.sshd = {
    services.openssh.enable = true;
  };
}

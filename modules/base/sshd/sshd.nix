{ ... }: {
  flake.nixosModules.sshd = { config, ... }: {
    services.openssh.enable = true;

#    sops.secrets."users/${user}/intern/public" = {};

 #   users.users.${user}.openssh.authorizedKeys.keyFiles = [
 #     config.sops.secrets."users/${user}/intern/public".path
  #  ];
  };
}

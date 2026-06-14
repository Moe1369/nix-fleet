{ inputs, ... }: {
  flake.nixosModules.security-sys-sudo = { user, lib, ... }: {
    security.sudo.extraRules = [
      {
        users = [ user ];
        commands = [
          {
            command = "/run/current-system/sw/bin/nixos-rebuild";
            options = [ "NOPASSWD" ];
          }
        ];
      }
    ];
  };
}

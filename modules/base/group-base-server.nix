{ inputs, config, ... }: {
  flake.nixosModules.base-sys-group-server = {
    imports = with inputs.self.nixosModules; [
      base-sys-boot-server
      base-sys-firmware
      base-sys-hm
      base-sys-locale
      base-sys-network
      base-sys-nix-settings
      base-sys-rtkit
      base-sys-shellapps
      base-sys-sshd
      base-sys-version
      base-sys-zsh
    ];
  };

  flake.homeModules.base-usr-group = { ... }: {
    imports = with config.flake.homeModules; [
      base-usr-git
      base-usr-zsh
      base-usr-ssh
    ];
  };
}

{ inputs, ... }: {
  flake.nixosModules.security-sys-sopsnix = { config, pkgs, ... }: {
    imports = [ inputs.sops-nix.nixosModules.sops ];
    sops.age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";
    environment.systemPackages = [ pkgs.age pkgs.sops ];
    sops.defaultSopsFile = ../secrets/secrets.yaml;
  };
}

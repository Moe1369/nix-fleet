{ inputs, ... }: {
  flake.nixosModules.users-sys-mo = { pkgs, config, ... }: {
    home-manager.extraSpecialArgs = {
      homeDirectory = "/home/mo";
    };

    sops.secrets."users/mo/password" = {
      neededForUsers = true;
    };
    users.mutableUsers = false;     
    users.users.mo = {
      isNormalUser = true;
      description = "Mohamed Chrayed";
      extraGroups = [ "networkmanager" "wheel" "video" "audio" ];
      shell = pkgs.zsh;
      hashedPasswordFile = config.sops.secrets."users/mo/password".path;
    };

    home-manager.users.mo = {
      home.username = "mo";
      home.homeDirectory = "/home/mo";
      home.stateVersion = "25.11";
    };
  };
}

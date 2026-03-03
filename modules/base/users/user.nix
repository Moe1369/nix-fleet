{ inputs, ... }: {
  flake.nixosModules.user = { pkgs, config, user, fullname, ... }: {
    home-manager.extraSpecialArgs = { inherit user fullname; };

    sops.secrets."users/${user}" = {
      neededForUsers = true;
    };
    
    users.users.${user} = {
      isNormalUser = true;
      description = fullname;
      extraGroups = [ "networkmanager" "wheel" "video" "audio" ];
      shell = pkgs.zsh;
      hashedPasswordFile = config.sops.secrets."users/${user}/password".path;
    };

    home-manager.users.${user} = {
      home.username = user;
      home.homeDirectory = "/home/${user}";
      home.stateVersion = "25.11";
    };
  };
}

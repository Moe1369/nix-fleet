{ inputs, ... }: {
  flake.nixosModules.user = { pkgs, user, fullname, ... }: {
    home-manager.extraSpecialArgs = { inherit user fullname; };
    
    users.users.${user} = {
      isNormalUser = true;
      description = fullname;
      extraGroups = [ "networkmanager" "wheel" "video" "audio" ];
      shell = pkgs.zsh;
    };
    home-manager.users.${user} = {
      home.username = user;
      home.homeDirectory = "/home/${user}";
      home.stateVersion = "25.11";
    };
  };
}

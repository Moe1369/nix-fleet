{ inputs, ... }: {
  flake.nixosModules.users-sys-deck = { pkgs, config, ... }: {
  
    sops.secrets."users/deck/password" = {
      neededForUsers = true;
    };
    sops.secrets."ssh/intern/public" = {
      owner = "deck";
      path = "/home/deck/.ssh/authorized_keys";
      mode = "0600";
    };
    
    systemd.tmpfiles.rules = [
      "d /home/deck/.ssh 0700 deck users -"
    ];

    users.mutableUsers = false;     
    users.users.deck = {
      isNormalUser = true;
      description = "Deck";
      extraGroups = [ "networkmanager" "wheel" "video" "audio" ];
      shell = pkgs.zsh;
      hashedPasswordFile = config.sops.secrets."users/deck/password".path;
    };
    home-manager.users.deck = {
      home.username = "deck";
      home.homeDirectory = "/home/deck";
      home.stateVersion = "25.11";
    };
  };
}

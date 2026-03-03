{ inputs, ... }: {
  flake.nixosModules.deck = { pkgs, config, ... }: {
    home-manager.extraSpecialArgs = {};

    sops.secrets."users/deck/password" = {
      neededForUsers = true;
    };
    users.mutableUsers = false;     
    users.users.deck = {
      isNormalUser = true;
      description = "SteamDeck";
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

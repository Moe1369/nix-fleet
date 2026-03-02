{ inputs, ... }: {
  flake.nixosModules.mo = { pkgs, ... }: {
    users.users.mo = {
      isNormalUser = true;
      description = "Mohamed Chrayed";
      extraGroups = [ "networkmanager" "wheel" "video" "audio" ];
      shell = pkgs.zsh; 
    };

    home-manager.users.mo = {
      home.username = "mo";
      home.homeDirectory = "/home/mo";
      home.stateVersion = "25.11";
    };
  };
}

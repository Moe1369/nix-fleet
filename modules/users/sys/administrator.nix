{ inputs, ... }: {
  flake.nixosModules.users-sys-administrator = { pkgs, config, ... }: {
  
    sops.secrets."users/administrator/password" = {
      neededForUsers = true;
    };
    sops.secrets."ssh/intern/public" = {
      owner = "administrator";
      path = "/home/administrator/.ssh/authorized_keys";
      mode = "0600";
    };
    
    systemd.tmpfiles.rules = [
      "d /home/administrator/.ssh 0700 administrator users -"
    ];

    users.mutableUsers = false;     
    users.users.administrator = {
      isNormalUser = true;
      description = "Mohamed Chrayed";
      extraGroups = [ "networkmanager" "wheel" "video" "audio" ];
      shell = pkgs.zsh;
      hashedPasswordFile = config.sops.secrets."users/administrator/password".path;
    };
    home-manager.users.administrator = {
      home.username = "administrator";
      home.homeDirectory = "/home/administrator";
      home.stateVersion = "25.11";
    };
  };
}

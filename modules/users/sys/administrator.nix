{ inputs, ... }: {
  flake.nixosModules.users-sys-administrator = { pkgs, config, ... }: {
  
    sops.secrets."users/administrator/password" = {
      neededForUsers = true;
    };
    sops.secrets."ssh/intern/public" = {
      owner = "mo";
      path = "/home/mo/.ssh/authorized_keys";
      mode = "0600";
    };
    
    systemd.tmpfiles.rules = [
      "d /home/mo/.ssh 0700 mo users -"
    ];

    users.mutableUsers = false;     
    users.users.mo = {
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

{ inputs, ... }: {
  flake.nixosModules.users-sys-nadine = { pkgs, config, ... }: {
  
    sops.secrets."users/nadine/password" = {
      neededForUsers = true;
    };
    sops.secrets."ssh/intern/public" = {
      owner = "nadine";
      path = "/home/nadine/.ssh/authorized_keys";
      mode = "0600";
    };
    
    systemd.tmpfiles.rules = [
      "d /home/nadine/.ssh 0700 nadine users -"
    ];

    users.mutableUsers = false;     
    users.users.nadine = {
      isNormalUser = true;
      description = "Nadine Peukert";
      extraGroups = [ "networkmanager" "wheel" "video" "audio" ];
      shell = pkgs.zsh;
      hashedPasswordFile = config.sops.secrets."users/nadine/password".path;
    };
    home-manager.users.nadine = {
      home.username = "nadine";
      home.homeDirectory = "/home/nadine";
      home.stateVersion = "25.11";
    };
  };
}

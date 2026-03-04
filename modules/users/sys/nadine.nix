{ inputs, ... }: {
  flake.nixosModules.users-sys-nadine = { pkgs, config, ... }: {
  
    sops.secrets."users/nadine/password" = {
      neededForUsers = true;
    };
    users.mutableUsers = false;     
    users.users.mo = {
      isNormalUser = true;
      description = "Nadine Peukert";
      extraGroups = [ "networkmanager" "wheel" "video" "audio" ];
      shell = pkgs.zsh;
      hashedPasswordFile = config.sops.secrets."users/mo/password".path;
    };

    home-manager.users.nadine = {
      home.username = "nadine";
      home.homeDirectory = "/home/nadine";
      home.stateVersion = "25.11";
    };
  };
}

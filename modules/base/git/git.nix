{ inputs, ... }: {
  flake.homeModules.git = { user, fullname, ... }: {
    programs.git = {
      enable = true;
      settings.userName = fullname;
      settings.userEmail = "${user}@chrayed.de";
      extraConfig = {
        init.defaultBranch = "main";
        core.editor = "nano";
      };
    };
  };
}

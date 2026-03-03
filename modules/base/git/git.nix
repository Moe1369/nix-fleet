{ inputs, ... }: {
  flake.homeManagerModules.git = { user, fullname, ... }: {
    programs.git = {
      enable = true;
      userName = fullname;
      userEmail = "${user}@chrayed.de";
      extraConfig = {
        init.defaultBranch = "main";
        core.editor = "nano";
      };
    };
  };
}

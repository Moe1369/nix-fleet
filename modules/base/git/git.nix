{ inputs, ... }: {
  flake.homeModules.git = { user, fullname, ... }: {
    programs.git = {
      enable = true;
      settings.user.name = fullname;
      settings.user.email = "${user}@chrayed.de";
      settings = {
        init.defaultBranch = "main";
        core.editor = "nano";
      };
    };
  };
}

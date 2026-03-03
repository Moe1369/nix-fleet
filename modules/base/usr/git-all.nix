{ inputs, ... }: {
  flake.homeModules.base-usr-git-all = { ... }: {
    programs.git = {
      enable = true;
      settings.user.name = "Mohamed Chrayed";
      settings.user.email = "mohamed@chrayed.de";
      settings = {
        init.defaultBranch = "main";
        core.editor = "nano";
      };
    };
  };
}

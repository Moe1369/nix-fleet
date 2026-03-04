{ ... }: {
  flake.homeModules.base-usr-ssh-all = { config, ... }: {
    home.file.".intern.pub".source = config.sops."users.mo.intern.public".path;
    home.file.".extern".source = config.sops."users.mo.extern.private".path;
  };
}

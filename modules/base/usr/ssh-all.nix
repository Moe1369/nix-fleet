{ ... }: {
  flake.homeModules.base-usr-ssh-all = { config, ... }: {
    home.file.".intern.pub".source = config.sops.secrets."users.mo.intern.public".path;
    home.file.".extern".source = config.sops.secrets."users.mo.extern.private".path;
  };
}

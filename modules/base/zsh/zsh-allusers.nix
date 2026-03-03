{ ... }: {
  flake.homeModules.zsh-allusers = { ... }: {
    home.file.".zshrc".source = ./dotfiles/zsh-config;
  };
}

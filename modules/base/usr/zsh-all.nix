{ ... }: {
  flake.homeModules.base-usr-zsh-all = { ... }: {
    home.file.".zshrc".source = ./dotfiles/zsh-config;
  };
}

{ ... }: {
  flake.homeModules.base-usr-zsh = { ... }: {
    home.file.".zshrc".source = ./dotfiles/zsh-config;
  };
}

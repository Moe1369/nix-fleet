{ ... }: {
  flake.nixosModules.zsh = { pkgs, ... }: {
    programs.zsh.enable = true;
    programs.zsh.enableCompletion = true;
    programs.zsh.syntaxHighlighting.enable = true;
    programs.zsh.autosuggestions.enable = true;
    programs.zsh.autosuggestions.async = true;
    programs.zsh.ohMyZsh.enable = true;
    programs.zsh.ohMyZsh.theme = "agnoster";
    users.defaultUserShell = pkgs.zsh;
  };

  flake.homeModules.zsh = { ... }: {
    home.file.".zshrc".source = ./dotfiles/zsh-config;
  };
}

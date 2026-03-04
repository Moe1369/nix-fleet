{ ... }: {
  flake.nixosModules.base-sys-zsh = { pkgs, host, ... }: {
    programs.zsh.enable = true;
    programs.zsh.enableCompletion = true;
    programs.zsh.syntaxHighlighting.enable = true;
    programs.zsh.autosuggestions.enable = true;
    programs.zsh.autosuggestions.async = true;
    programs.zsh.ohMyZsh.enable = true;
    programs.zsh.ohMyZsh.theme = "agnoster";
    users.defaultUserShell = pkgs.zsh;
    programs.zsh.shellAliases = {
      update = "sudo nix flake update --flake git+https://gitea.chrayed.de/Chrayed/nix-fleet";
      rebuild = "sudo nixos-rebuild switch --refresh --flake git+https://gitea.chrayed.de/Chrayed/nix-fleet#${host}";
    };
  };
}

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
      rebuild-from-gitea = "sudo nixos-rebuild switch --refresh --flake git+https://gitea.chrayed.de/Chrayed/nix-fleet#${host}";
      rebuild = "sudo nixos-rebuild switch --refresh --flake github:Moe1369/nix-fleet#${host}";
    };
  };
}

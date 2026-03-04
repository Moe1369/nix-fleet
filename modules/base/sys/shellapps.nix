{ ... }: {
  flake.nixosModules.base-sys-shellapps = { pkgs, ... }: {
    programs.nano.enable = true;
    programs.nano.syntaxHighlight = true;
    environment.systemPackages = with pkgs; [
      wget
      git
      nil
      yaml-language-server
      tree
    ];
  };
}

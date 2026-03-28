{ ... }: {
  flake.nixosModules.apps-sys-ollama = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      newelle
    ];
  };
}

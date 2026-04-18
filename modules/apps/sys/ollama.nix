{ ... }: {
  flake.nixosModules.apps-sys-ollama = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      newelle
    ];
    services.ollama = {
      enable = true;
      package = pkgs.ollama-rocm;
      loadModels = [ "gpt-oss:20b" ];
    };
  };
}

{ ... }: {
  flake.nixosModules.apps-sys-ollama = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      newelle
    ];
    services.ollama = {
      enable = true;
      package = pkgs.ollama-rocm;
      loadModels = [ "llama3.2:3b" "deepseek-r1:1.5b" ];
    };
  };
}

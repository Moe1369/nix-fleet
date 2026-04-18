{ ... }: {
  flake.nixosModules.apps-sys-ai = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      opencode
      alpaca
    ];
    services.ollama = {
      enable = true;
      package = pkgs.ollama-rocm;
      loadModels = [ "gpt-oss:20b" "gemma4:26b" "gemma4:e4b" ];
    };
  };
}

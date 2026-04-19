{ ... }: {
  flake.nixosModules.apps-sys-ai = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      opencode
      alpaca
      newelle
      vscode
    ];
    services.ollama = {
      enable = true;
      package = pkgs.ollama-rocm;
      host = [ "0.0.0.0" ];
      loadModels = [ "qwen3.6:35b" "gpt-oss:20b" "gemma4:26b" "gemma4:e4b" ];
      };
    };
  };
}

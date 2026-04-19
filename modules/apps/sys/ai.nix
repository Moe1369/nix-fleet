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
      host = "0.0.0.0";
      openFirewall = true;
      loadModels = [ "qwen3.6:35b" "gpt-oss:20b" "gemma4:26b" "gemma4:e4b" ];
    };

    services.wyoming.faster-whisper = {
      servers.default = {
        enable = true;
        model = "large-v3";
        language = "de"; 
        uri = "tcp://0.0.0.0:10300";
        device = "auto";
      };
    };
  };
}

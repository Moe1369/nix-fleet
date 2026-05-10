{ ... }: {
  flake.nixosModules.apps-sys-ai = { pkgs, lib, ... }: {

    users.users.wyoming = {
      isSystemUser = true;
      group = "wyoming";
      extraGroups = [ "audio" "dialout" ];
    };
    users.groups.wyoming = {};

    services.ollama = {
      enable = true;
      package = pkgs.ollama-rocm;
      host = "0.0.0.0";
      openFirewall = true;
      loadModels = [ "gemma4:26b" ];
    };

    services.wyoming = {
      faster-whisper.servers.default = {
        enable = true;
        model = "turbo";
        language = "de";
        uri = "tcp://0.0.0.0:10300";
        device = "auto";
      };

      piper.servers.default = {
        enable = true;
        voice = "de_DE-ramona-low";
        uri = "tcp://0.0.0.0:10200";
        lengthScale = 1.2;   # Geschwindigkeit: >1 = langsamer, <1 = schneller
        noiseScale = 0.667;  # Variation in der Stimme
        noiseWidth = 0.4;    # Phonem-Längen-Variation
      };

      openwakeword = {
        enable = true;
        uri = "tcp://0.0.0.0:10400";
      };

      satellite = {
        enable = true;
        uri = "tcp://0.0.0.0:10700";
        name = "ai-satellite";
        user = "wyoming";
        group = "wyoming";
        vad.enable = true;
      };
    };

    networking.firewall.allowedTCPPorts = [
      11434  # ollama
      10200  # wyoming piper (TTS)
      10300  # wyoming faster-whisper (STT)
      10400  # wyoming openwakeword
      10700  # wyoming satellite
    ];
  };
}

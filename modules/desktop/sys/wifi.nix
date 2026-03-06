{ ... }: {
  flake.nixosModules.desktop-sys-wifi = { config, ... }: {
    sops.secrets."infrastructure/wifi/ssid" = {};
    sops.secrets."infrastructure/wifi/password" = {};

    networking.networkmanager = {
      ensureProfiles = {
        environmentFiles = [
          config.sops.secrets."infrastructure/wifi/ssid".path
          config.sops.secrets."infrastructure/wifi/password".path
        ];
        profiles = {
          "home" = {
            connection = { id = "home"; type = "wifi"; autoconnect = true; };
            wifi = { mode = "infrastructure"; ssid = "$WIFI_SSID"; };
            wifi-security = {
              key-mgmt = "wpa-psk";
              psk = "$WIFI_PASSWORD";
            };
          };
        };
      };
    };
  };
}

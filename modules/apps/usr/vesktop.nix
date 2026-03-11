{ ... }: {
  flake.homeModules.apps-usr-vesktop-all = { config, pkgs, ... }: {
    home.file.".config/autostart/vesktop.desktop" = {
      text = ''
        [Desktop Entry]
        Type=Application
        Name=Vesktop
        Comment=Vesktop autostart script
        Exec=${pkgs.vesktop}/bin/vesktop --enable-speech-dispatcher --silent
        StartupNotify=false
        Terminal=false
        Icon=vesktop
      '';
    };
  };
}

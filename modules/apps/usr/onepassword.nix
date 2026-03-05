{ ... }: {
  flake.homeModules.apps-usr-onepassword-all = { config, pkgs, ... }: {
    home.file.".config/autostart/1password.desktop" = {
      text = ''
        [Desktop Entry]
        Name=1Password
        Exec=${pkgs._1password-gui}/bin/1password --silent %U
        Terminal=false
        Type=Application
        Icon=1password
      '';
    };
  };
}

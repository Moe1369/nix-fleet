{ inputs, ... }:
{
  flake.homeModules.kde-usr-plasma-nadine = { ... }:
  {
    home.file."Code/.directory".source = ./dotfiles/code-folder;
    home.file.".config/haruna/haruna.conf".source = ./dotfiles/haruna-config;
    home.file.".local/share/user-places.xbel".source = ./dotfiles/userplaces-${hostName};
    home.file.".config/kde-material-you-colors/config.conf".source = ./dotfiles/kmyc-config;
    home.file.".config/autostart/kde-material-you-colors.desktop".source = ./dotfiles/kmyc-desktop;
    home.file.wallpaper = {
      recursive = true;
      source = ./wallpaper-nadine;
      target = "Bilder/Hintergründe";
    };

    programs.plasma = {
      enable = true;
      immutableByDefault = false;

      workspace = {
        wallpaperSlideShow.path = "${config.home.homeDirectory}/Bilder/Hintergründe";
        wallpaperSlideShow.interval = 864000;
        windowDecorations.library = "org.kde.klassy";
        windowDecorations.theme = "Klassy";
        cursor = {
          size = 24;
          theme = "Breeze_Light";
        };
        colorScheme = "MaterialYouDark";
      };

      kscreenlocker = {
        appearance.wallpaper = "${config.home.homeDirectory}/Bilder/Hintergründe/wallpaper-beach.png";
        lockOnResume = false;
        lockOnStartup = false;
        passwordRequired = false;
      };

      powerdevil.AC = {
        dimDisplay.enable = false;
        turnOffDisplay.idleTimeoutWhenLocked = 600;
      };

      session.general.askForConfirmationOnLogout = false;

      fonts = {
        menu = { family = "Adwaita Sans"; pointSize = 10; weight = "normal"; };
        general = { family = "Adwaita Sans"; pointSize = 10; weight = "normal"; };
        small = { family = "Adwaita Sans"; pointSize = 8; weight = "normal"; };
        toolbar = { family = "Adwaita Sans"; pointSize = 10; weight = "normal"; };
        fixedWidth = { family = "Adwaita Mono"; pointSize = 11; weight = "normal"; };
        windowTitle = { family = "Adwaita Sans"; pointSize = 12; weight = "normal"; };
      };

      panels = [
        {
          location = "bottom";
          floating = true;
          alignment = "center";
          height = 46;
          lengthMode = "fit";
          hiding = "dodgewindows";
          widgets = [
            {
              name = "org.kde.plasma.kickoff";
              config.General.icon = "nix-snowflake";
            }
            "org.kde.plasma.marginsseparator"
            {
              iconTasks.launchers = [
                "applications:org.kde.dolphin.desktop"
                "applications:org.kde.konsole.desktop"
                "applications:google-chrome.desktop"
                "applications:steam.desktop"
                "applications:vesktop.desktop"
              ];
            }
            "org.kde.plasma.marginsseparator"
            {
              systemTray.items.shown = [
                "org.kde.plasma.bluetooth"
                "org.kde.plasma.networkmanagement"
              ];
            }
            {
              digitalClock = {
                calendar.firstDayOfWeek = "monday";
                time.format = "24h";
              };
            }
          ];
        }
      ];
    };
  };
}

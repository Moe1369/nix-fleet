{ ... }: {
  flake.nixosModules.gnome = { pkgs, ... }: {
    services.desktopManager.gnome.enable = true;
    services.gnome.core-apps.enable = false;
    services.gnome.core-developer-tools.enable = false;
    services.gnome.games.enable = false;
  };

  flake.homeModules.gnome = { ... }: {
    dconf.settings = {
      "org/gnome/shell/keybindings" = {
        focus-active-notification = [];
        open-new-window-application-1 = [];
        open-new-window-application-2 = [];
        open-new-window-application-3 = [];
        open-new-window-application-4 = [];
        open-new-window-application-5 = [];
        open-new-window-application-6 = [];
        open-new-window-application-7 = [];
        open-new-window-application-8 = [];
        open-new-window-application-9 = [];
        toggle-message-tray = ["<Super>N"];
      };
      "org/gnome/settings-daemon/plugins/media-keys" = {
        help = [];
        home = ["<Super>E"];
        screenreader = [];
        magnifier = [];
        magnifier-zoom-in = [];
        magnifier-zoom-out = [];
      };
      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
        command = ["kgx --tab"];
        name = ["Console"];
      };
      "org/gnome/desktop/wm/keybindings" = {
        activate-window-menu = [];
        always-on-top = ["<Super>T"];
        begin-move = ["<Super>M"];
        begin-resize = ["<Super>R"];
        close = ["<Super>Q"];
        cycle-group = [];
        cycle-group-backward = [];
        cycle-panels = [];
        cycle-panels-backward = [];
        cycle-windows = [];
        cycle-windows-backward = [];
        lower = [];
        maximize = [];
        maximize-horizontally = [];
        minimize = ["<Super>Down"];
        move-to-monitor-down = [];
        move-to-monitor-left = [];
        move-to-monitor-right = [];
        move-to-monitor-up = [];
        move-to-workspace-1 = [];
        move-to-workspace-down = [];
        move-to-workspace-last = [];
        move-to-workspace-left = [];
        move-to-workspace-right = [];
        move-to-workspace-up = [];
        show-desktop = ["<Super>D"];
        switch-applications = ["<Alt>Tab"];
        switch-applications-backward = ["<Shift><Alt>Tab"];
        switch-group = ["<Super>Tab"];
        switch-group-backward = ["<Shift><Super>Tab"];
        panel-run-dialog = ["<Alt>Space"];
        switch-input-source = [];
        switch-input-source-backward = [];
        switch-panels = [];
        switch-panels-backward = [];
        switch-to-workspace-1 = [];
        switch-to-workspace-down = [];
        switch-to-workspace-last = [];
        switch-to-workspace-left = [];
        switch-to-workspace-right = [];
        switch-to-workspace-up = [];
        toggle-fullscreen = ["<Super>F"];
        toggle-maximized = ["<Super>Up"];
        toggle-on-all-workspaces = ["<Super>S"];
        unmaximize = [];
      };
      "org/gnome/mutter" = {
        experimental-features = ["variable-refresh-rate"];
        center-new-windows = true;
        edge-tiling = true;
        dynamic-workspaces = true;
      };
      "org/gnome/desktop/interface" = {
        font-name = "IBM Plex Sans 11";
        document-font-name = "IBM Plex Sans 11";
        monospace-font-name = "IBM Plex Mono 11";
        gtk-theme = "adw-gtk3";
        enable-hot-corners = false;
        cursor-theme = "Adwaita";
      };
      "org/gnome/shell/extensions/rounded-window-corners-reborn" = {
        border-width = -2;
        skip-libadwaita-app = false;
      };
      "org/gnome/shell/extensions/clipboard-indicator" = {
        toggle-menu = ["<Super>V"];
      };
      "org/gnome/shell/extensions/azwallpaper" = {
        slideshow-use-absolute-time-for-duration = true;
      };
      "org/gnome/desktop/background" = {
        color-shading-type = "solid";
        picture-options = "zoom";
      };
      "org/gnome/shell/extensions/nightthemeswitcher/commands" = {
        enabled = true;
        sunrise = "gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3' && gsettings set org.gnome.desktop.interface color-scheme 'default'";
        sunset = "gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3-dark' && gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'";
      };
      "org/gnome/shell" = {
        enabled-extensions = [
          "light-style@gnome-shell-extensions.gcampax.github.com"
          "clipboard-indicator@tudmotu.com"
          "AlphabeticalAppGrid@stuarthayhurst"
          "rounded-window-corners@fxgn"
          "appindicatorsupport@rgcjonas.gmail.com"
          "nightthemeswitcher@romainvigier.fr"
          "azwallpaper@azwallpaper.gitlab.com"
        ];
      };
    };
  };
}

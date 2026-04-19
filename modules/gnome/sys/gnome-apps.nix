{ ... }: {
  flake.nixosModules.gnome-sys-gnome-apps = { pkgs, ...}:{
     environment.systemPackages = with pkgs; [
       dconf-editor
       adw-gtk3
       refine
       resources
       nautilus
       nautilus-python
       sushi
       gnome-text-editor
       gnome-console
       gnome-calculator
       loupe
       cine
       decibels
       tsukimi
       papers
       keypunch
       baobab
       turnon
       blanket
       kando
       go-hass-agent
       impression
       gnome-disk-utility
       gnomeExtensions.auto-accent-colour
       gnomeExtensions.appindicator
       gnomeExtensions.caffeine
       gnomeExtensions.clipboard-indicator
       gnomeExtensions.kando-integration
       gnomeExtensions.rounded-window-corners-reborn
       gnomeExtensions.night-theme-switcher
       gnomeExtensions.tinted-shell
       gnomeExtensions.middle-click-to-close-in-overview
   ];
  };
}

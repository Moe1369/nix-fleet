{ ... }: {
  flake.nixosModules.gnome-sys-gnome-apps = { pkgs-unstable, ...}:{
     environment.systemPackages = with pkgs-unstable; [
       dconf-editor
       adw-gtk3
       refine
       nautilus
       nautilus-python
       sushi
       gnome-text-editor
       gnome-console
       loupe
       cine
       decibels
       tsukimi
       papers
       gnomeExtensions.auto-accent-colour
       gnomeExtensions.appindicator
       gnomeExtensions.clipboard-indicator
       gnomeExtensions.rounded-window-corners-reborn
       gnomeExtensions.night-theme-switcher
       gnomeExtensions.tinted-shell
       gnomeExtensions.middle-click-to-close-in-overview
   ];
  };
}

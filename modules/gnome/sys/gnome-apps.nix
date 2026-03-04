{ ... }: {
  flake.nixosModules.gnome-sys-gnome-apps = { pkgs-unstable, ...}:{
     environment.systemPackages = with pkgs-unstable; [
       adw-gtk3
       refine
       gdm-settings
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
       ignition





       gnomeExtensions.tinted-shell
   ];
  };
}

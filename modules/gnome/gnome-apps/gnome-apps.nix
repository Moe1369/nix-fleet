{ ... }: {
  flake.nixosModules.gnome-apps = { pkgs-unstable, ...}:{
     environment.systemPackages = with pkgs-unstable; [
       adw-gtk3
       refine
       nautilus
       nautilus-python
       sushi
       gnome-text-editor
       gnome-console
       loupe
       cine
       tsukimi
   ];
  };
}

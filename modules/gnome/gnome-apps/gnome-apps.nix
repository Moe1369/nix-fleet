{ ... }: {
  flake.nixosModules.gnome-apps = { pkgs-unstable, ...}:{
     environment.systemPackages = with pkgs-unstable; [
       nautilus
       nautilus-python
       sushi
       gnome-text-editor
       ptyxis
       loupe
       cine
   ];
  };
}

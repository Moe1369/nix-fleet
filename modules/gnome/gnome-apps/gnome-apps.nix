{ ... }: {
  flake.nixosModules.gnome-apps = { pkgs-unstable, ...}:{
     environment.systemPackages = with pkgs-unstable; [
       gnome-text-editor
       ptyxis
   ];
  };
}

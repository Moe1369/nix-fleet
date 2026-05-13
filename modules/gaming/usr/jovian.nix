{ ... }: {
  flake.homeModules.gaming-usr-jovian = { ... }: {
    home.file.".steam/steam/.cef-enable-remote-debugging" = {
      text = "";
    };
  };
}

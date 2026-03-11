{ ... }: {
  flake.homeModules.gaming-usr-jovian-all = { ... }: {
    home.file.".steam/steam/.cef-enable-remote-debugging" = {
      text = "";
    };
  };
}

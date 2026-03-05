{ ... }: {
  flake.nixosModules.kde-sys-plasma-apps = { pkgs, pkgs-unstable, ... }: {
    environment.systemPackages = with pkgs; [
      kdePackages.kate
      kdePackages.isoimagewriter
      kdePackages.gwenview
      kdePackages.okular
      kdePackages.kdenlive
      kdePackages.elisa
      kdePackages.qtwebengine
      haruna
      krita
      kdePackages.kcolorchooser
      kdePackages.kfind
      kdePackages.kcalc
      kdePackages.filelight
      kdePackages.skanlite
      kdePackages.ksystemlog
      kdePackages.partitionmanager
      kdePackages.plasma-browser-integration
      pywal
    ];
    environment.systemPackages = with pkgs-unstable; [
      klassy
      python3.14-kde-material-you-colors
    ];
  };
}

{ ... }:
{
  flake.nixosModules.kde-sys-plasma-apps = { pkgs, ... }:
  {
    environment.systemPackages = with pkgs; [
      adwaita-fonts
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
      klassy
      kde-material-you-colors
      kde-material-you-colors.widget
    ];
  };
}

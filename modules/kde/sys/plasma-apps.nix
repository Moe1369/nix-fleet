{ inputs, ... }:
{
  flake.nixosModules.kde-sys-plasma-apps = { pkgs, pkgs-unstable, ... }:
  let
    kostek-pkgs = inputs.kostek011-pkgs.packages.${pkgs.system};
  in
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
      pywal
      klassy
      kostek-pkgs.kde-material-you-colors
      kostek-pkgs.kde-material-you-colors.widget
    ];
  };
}

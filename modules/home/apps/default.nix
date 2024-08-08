{ pkgs, ... }: {
  # holds default application packages

  imports = [
    ./firefox.nix
    ./spotify.nix
  ];


  home.packages = with pkgs; [
    discord
    webcord
    google-chrome
    slack
    kdePackages.filelight
    zathura
    # texlive.combined.scheme-small
    # texliveMedium
    texliveFull
    texlivePackages.lastpage
    speedtest-cli
    zed-editor


# rust stuff
tokei
dust
eza 
  ];
}

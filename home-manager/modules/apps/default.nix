{ pkgs, ... }: {
  # holds default application packages

  imports = [
    ./firefox.nix
    ./spotify.nix
  ];


  home.packages = with pkgs; [
    discord
    google-chrome
    slack
    kdePackages.filelight
    zathura
    # texlive.combined.scheme-small
    texliveMedium
  ];
}

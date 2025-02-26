{ pkgs, ... }: {
  # holds default application packages

  imports = [ ./firefox.nix ./spotify.nix ];

  home.packages = with pkgs; [
    discord
    webcord
    google-chrome
    slack
    zulip
    kdePackages.filelight
    zathura
    # gimp-with-plugins
    # texlive.combined.scheme-small
    # texliveMedium
    texliveFull
    texlivePackages.lastpage
    typst
    speedtest-cli
    # zed-editor

    # rust stuff
    tokei
    dust
    eza

  ];
}

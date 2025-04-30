{ pkgs, ... }: {
  # holds default application packages

  imports = [ ./firefox.nix ./spotify.nix ];

  home.packages = with pkgs; [
    discord
    google-chrome
    slack
    zulip
    osu-lazer-bin

    kdePackages.filelight

    zathura

    # gimp-with-plugins
    # texlive.combined.scheme-small
    # texliveMedium
    texliveFull
    texlivePackages.lastpage

    typst
    yazi
    zoxide

    # unityhub
    flatpak

    # steam

    protonmail-desktop

    # zed-editor
    speedtest-cli

    # rust stuff
    tokei
    dust
    eza
    ripgrep
    electron

  ];
}

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

    blender
    obsidian

    # gimp-with-plugins
    # texlive.combined.scheme-small
    # texliveMedium
    texliveFull
    texlivePackages.lastpage

    typst
    yazi
    zoxide

    protonmail-desktop
    # unityhub

    # steam

    # zed-editor
    speedtest-cli

    # rust stuff
    tokei
    dust
    eza
    ripgrep
    electron

    godot_4

  ];
}

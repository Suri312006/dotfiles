{ pkgs, ... }: {
  imports = [
    ./kitty
    ./zsh
    ./zellij

    ./git.nix
  ];

  programs.git.enable = true;
  home.packages = with pkgs; [
    rustup
    go
    bun
    nodejs
    valgrind
    postman
  ];
}

{ pkgs, ... }: {
  imports = [
    ./kitty
    ./zsh
    ./zellij
  ];

  programs.git.enable = true;
  home.packages = with pkgs; [
    rustup
    go
    bun
    nodejs
  ];
}

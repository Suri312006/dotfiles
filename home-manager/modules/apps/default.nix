{ pkgs, ... }: {
  # holds default application packages
  home.packages = with pkgs; [
    discord
    google-chrome
    slack
  ];
}

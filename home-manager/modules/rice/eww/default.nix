{ pkgs, ... }: {

imports = [ ./scripts.nix ];

  home.packages = [ pkgs.eww ];

  home.file.".config/eww".source = ./bar;


}

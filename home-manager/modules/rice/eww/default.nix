{ pkgs, ... }: {

  imports = [ ./scripts.nix ];

  home.packages = [ 
  pkgs.eww 
  pkgs.sass
  ];

  home.file.".config/eww".source = ./bar;


}

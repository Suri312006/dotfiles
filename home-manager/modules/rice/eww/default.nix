{ pkgs, ... }: {

  home.file.".config/eww".source = ./config;

  imports = [ 
  ./scripts.nix 
  ./icons.nix
  ];


  programs.eww = {
    # configDir = ./config;
    enable = true;
  };



}

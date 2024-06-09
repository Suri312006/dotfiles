{ pkgs, ... }: {

  imports = [ 
  ./scripts.nix 
  ./icons.nix
  ];


  programs.eww = {
    configDir = ./config;
    enable = true;
  };



}

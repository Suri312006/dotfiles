{ pkgs, ... }: {

  imports = [ ./scripts.nix ];


  programs.eww = {
    configDir = ./config;
    enable = true;
  };



}

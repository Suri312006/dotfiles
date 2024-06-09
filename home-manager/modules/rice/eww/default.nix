{ pkgs, ... }: {


  imports = [ 
  ./scripts.nix 
  ./icons.nix
  ];


  programs.eww = {
    # configDir = ./config;
    enable = true;
  };

  # home.file.".config/eww".source = ./config;


}

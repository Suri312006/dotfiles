{ pkgs, lib, inputs, ... }:
{
  imports = [ inputs.spicetify-nix.homeManagerModules.default ];
programs.spicetify =
   let
     spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
   in
   {
     enable = true;
     enabledExtensions = with spicePkgs.extensions; [
       adblock
       hidePodcasts
       shuffle # shuffle+ (special characters are sanitized out of extension names)
     ];
     theme = spicePkgs.themes.catppuccin;
     colorScheme = "mocha";
   };
}
#let
#  spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
#in
#{
  # allow spotify to be installed if you don't have unfree enabled already
  #nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    #"spotify"
  #];

  # import the flake's module for your system
  #imports = [ inputs.spicetify-nix.homeManagerModules.default ];

  # configure spicetify :)
  #programs.spicetify =
    #{
      #enable = true;
      #theme = lib.mkForce spicePkgs.themes.Onepunch;
      #colorScheme = lib.mkForce "Onepunch";

      #enabledExtensions = with spicePkgs.extensions; [
        #fullAppDisplay
        #shuffle # shuffle+ (special characters are sanitized out of ext names)
        #hidePodcasts
        #adblock
      #];
    #};
#}

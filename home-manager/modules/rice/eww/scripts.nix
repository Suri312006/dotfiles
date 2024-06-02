{ pkgs, ... }:
let
  suri_eww = pkgs.writeShellScriptBin "suri_eww" ''
    eww d
    eww open-many mon lap
  '';

in
{
  home.packages = [ suri_eww ];
}

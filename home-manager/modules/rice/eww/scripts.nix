{ pkgs, ... }:
let
  suri_eww = pkgs.writeShellScriptBin "suri_eww" ''
    eww d
    eww open bar --screen 0 --id lap
    eww open bar --screen 1 --id mon
  '';

in
{
  home.packages = [ suri_eww ];
}

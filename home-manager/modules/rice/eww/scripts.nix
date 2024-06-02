{ pkgs, ... }:
let
  suri_eww = pkgs.writeShellScriptBin "suri_eww" ''
    eww d
    eww open example
  '';

in
{
  home.packages = [ suri_eww ];
}

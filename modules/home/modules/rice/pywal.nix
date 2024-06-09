{ pkgs, lib, config, ... }:
with lib;
let
  pywalfox_wrapper = pkgs.writeShellScriptBin "pywalfox_wrapper" ''
    ${pkgs.pywalfox-native}/bin/pywalfox start
  '';
in
{
  options.pywal.enable = mkEnableOption "Pywal";
  config = mkIf config.pywal.enable {
    home.packages = with pkgs;
      [ pywal pywalfox-native ];
    home.file = {
      ".mozilla/native-messaging-hosts/pywalfox.json".text =
        builtins.replaceStrings [ "<path>" ]
          [ "${pywalfox_wrapper}/bin/pywalfox_wrapper" ]
          (builtins.readFile
            "${pkgs.pywalfox-native}/lib/python3.11/site-packages/pywalfox/assets/manifest.json");
    };
  };
}

{ lib, config, pkgs, ... }:
let
  cfg = config.me.boot;
in

with lib;
{
  options = {
    boot.grub.enable = mkOption {
      default = false;
      type = with types; bool;
      description = ''
        GRUB boot loader
      '';
    };
    boot.systemd.enable = mkOption {
      default = true;
      type = with types; bool;
      description = ''
        systemd boot loader
      '';
    };
  };

  config = mkIf cfg.grub.enable {
    imports = [ ./grub.nix ];
  } // mkIf cfg.systemd.enable {
    imports = [ ./systemd.nix];
  };
}

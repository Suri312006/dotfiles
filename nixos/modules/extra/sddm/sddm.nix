{ pkgs, ... }: {
  services.displayManager = {
    sddm.enable = true;
    sddm.theme = "${import ../pkgs/sddm-theme.nix {inherit pkgs; }}";
  };
}

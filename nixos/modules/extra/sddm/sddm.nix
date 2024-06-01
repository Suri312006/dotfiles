{ pkgs, ... }: {
  services.displayManager = {
    sddm.enable = true;
    sddm.theme = "${import ./sddm-theme.nix {inherit pkgs; }}";
  };
}

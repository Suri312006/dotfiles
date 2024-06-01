{ pkgs, ... }: {
  
  services.displayManager.sddm = {
    enable = true;
    theme = "${import ./sddm-theme.nix {inherit pkgs; }}";

  # wayland.enable = true;

  };
}

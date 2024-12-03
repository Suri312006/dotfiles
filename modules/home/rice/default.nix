{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./qt.nix
    ./gtk.nix
    ./pywal.nix
    ./mako.nix
    # ./eww
    ./ags.nix
    ./waybar
  ];

  pywal.enable = false;

  home.packages = with pkgs; [
    wofi
    nwg-look
    fastfetch
  ];

  home.file."Pictures/Wallpapers" = {
    source = builtins.fetchGit {
      url = "https://github.com/suri312006/wallpaperbank";
      rev = "5c549a4d63e4d15506c2648c3bdc07a8360bbeaa";
    };
  };

  # stylix.autoEnable = true;
  # stylix.targets.zellij.enable = true;

  # home.file."~/Pictures/Wallpaper.png" =
}

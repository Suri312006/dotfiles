{pkgs, ...}: {
  fonts.packages = with pkgs; [
    # (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
    # nerd
    # rPackages.phosphoricons
    nerd-fonts.fira-code
    monaspace
  ];
}

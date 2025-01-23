{ inputs, ... }: {
  home.packages = [ inputs.ghostty.packages.x86_64-linux.default ];

  home.file.".config/ghostty/config".text = ''
    font-family = ""
    font-family = "Monaspace Krypton"
    font-size = "9"
    theme = "GruvboxDarkHard"
  '';
}

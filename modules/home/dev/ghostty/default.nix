{ inputs, ... }: {
  home.packages = [ inputs.ghostty.packages.x86_64-linux.default ];

  home.file.".config/ghostty".text = ''
    font-family=""
    font-family= "Monaspace Krypton Var SemiBold"
  '';
}

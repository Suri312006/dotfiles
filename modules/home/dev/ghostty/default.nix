{ inputs, ... }: {
  home.packages = [ inputs.ghostty.packages.x86_64-linux.default ];

  home.file.".config/ghostty/config".text = ''
     font-family = ""
     font-family = "Monaspace Krypton SemiBold"
     font-size = "11"
     window-padding-x = 4
     window-padding-y = 3,1
     theme = "gruvbox-material"
    # initial-command = "zellij"
  '';
}

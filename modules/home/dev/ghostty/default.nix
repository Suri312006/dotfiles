{ inputs, ... }: {
  home.packages = [ inputs.ghostty.packages.x86_64-linux.default ];

  home.file.".config/ghostty/config".text = ''

    font-family = ""

    font-family = "Monaspace Krypton SemiBold"

    font-family-bold = "Monaspace Argon SemiBold"

    font-family-italic = "Monaspace Neon SemiBold"

    font-family-bold-italic = "Monaspace Neon SemiBold"


    font-feature = "calt"
    font-feature = "clig"
    font-feature = "liga"
    font-feature = "dlig"
    font-feature = "ss01"
    font-feature = "ss02"
    font-feature = "ss03"
    font-feature = "ss04"
    font-feature = "ss05"
    font-feature = "ss06"
    font-feature = "ss07"
    font-feature = "ss08"

    font-size = "10.5"

    window-padding-x = 4

    window-padding-y = 3,1

    # theme = "gruvbox-material"
    theme = "ayu"
  '';
}

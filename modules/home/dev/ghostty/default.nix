{ inputs, ... }: {
  home.packages = [ inputs.ghostty.packages.x86_64-linux.default ];

  home.file.".config/ghostty/config".text = ''

    font-family = ""

    font-family = "Monaspace Krypton SemiBold"

    font-family-bold = "Monaspace Neon SemiBold"

    font-family-italic = "Monaspace Argon SemiBold"

    font-family-bold-italic = "Monaspace Neon SemiBold"

    cursor-style = "bar"


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

    font-size = "10.1"

    window-padding-x = 1

    window-padding-y = 1,1

    # theme = "gruvbox-material"
    theme = GruvboxDark
    # theme = ayu
  '';
}

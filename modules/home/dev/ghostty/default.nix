{ inputs, ... }: {
  home.packages = [ inputs.ghostty.packages.x86_64-linux.default ];

  home.file.".config/ghostty/config".text = ''

    font-family = ""

    font-family = "Monaspace Krypton SemiBold"

    font-family-bold = "Monaspace Neon SemiBold"

    font-family-italic = "Monaspace Argon Bold Italic"

    font-family-bold-italic = "Monaspace Neon Bold Italic"

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

    font-size = "10.2"

    window-padding-x = 5,5

    window-padding-y = 5,5

    # theme = "gruvbox-material"
    theme = GruvboxDarkHard
    # theme = ayu
  '';
}

{ pkgs }:
let
  image = ../../../wallpapers/curr_wall.png;
in
pkgs.stdenv.mkDerivation {
  name = "sddm-theme";
  src = pkgs.fetchFromGitHub {
    owner = "MarianArlt";
    repo = "sddm-sugar-dark";
    rev = "ceb2c455663429be03ba62d9f898c571650ef7fe";
    hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
  };

  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
    rm Background.jpg
    cp -r ${image} $out/Background.jpg
  '';

}

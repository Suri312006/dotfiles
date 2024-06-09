{ fetchFromGitHub }:
{
  home.file.".config/nvim".source = {
    source = fetchFromGitHub {
      owner = "suri312006";
      repo = "nvim";
      rev = "f62c2808a9e52e1ad0a936337a0de8c9a8199322";
      hash = null;
    };
  };
}



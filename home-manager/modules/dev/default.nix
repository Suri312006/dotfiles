{ pkgs, ... }: {
  imports = [
    ./kitty
    ./zsh
    ./zellij

    ./git.nix
  ];

  programs.git.enable = true;
  home.packages = with pkgs; [
    rustup
    go
    bun
    nodejs
    valgrind
    gdb
    postman


    # gnumake42
    # llvmPackages_18.libcxxClang



    # c stuff

    cmake
    ninja
    clang13Stdenv
  ];
}

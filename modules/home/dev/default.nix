{ pkgs, ... }: {
  imports = [ ./fish.nix ./zellij ./starship ./ghostty ./helix ./langs ];

  programs.git.enable = true;
  home.packages = with pkgs; [
    rustup
    go
    bun
    nodejs
    valgrind
    gdb

    postman
    glow

    python3
    awscli2

    cmake
    ninja
    clang13Stdenv

    valgrind

    # build tools
    cmake
    gcc
    gnumake
    ninja
    pkg-config

    # generates .cache and compile_commands.json
    # files required by clangd
    bear

    # provides clangd (LSP)
    # provides libraries
    # NOTE: make sure mason.nvim don't install clangd
    clang-tools

    # libs
    gpp # c++ module?, decrypt
    gecode # c++ module

    vscode

    tshark

    air

    flyctl

    just
  ];
}

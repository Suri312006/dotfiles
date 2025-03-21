{ pkgs, ... }: {
  imports = [
    ./kitty
    ./zsh
    ./nvim.nix
    # #killnixvim
    # ./nixvim
    ./zellij
    ./starship
    ./ghostty

    ./git.nix
    ./wezterm
    ./helix.nix
    ./langs
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
    glow

    nixd
    nil
    python3
    awscli2

    # gnumake42
    # llvmPackages_18.libcxxClang

    # c stuff

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

    # required by codelldb (debugger)
    # lldb # libraries conflicts with clang-tools
    gdb

    # libs
    gpp # c++ module?, decrypt
    gecode # c++ module

    vscode

    tshark

    air

    flyctl

    just
    # rust-analyzer
  ];
}

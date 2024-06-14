{ pkgs, ... }: {
  imports = [
    ./kitty
    ./zsh
    ./nvim.nix
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

  ];

  # valgrant
# Minimal configuration for NFS support with Vagrant.
  services.nfs.server.enable = true;
  
  # Add firewall exception for VirtualBox provider 
  networking.firewall.extraCommands = ''
    ip46tables -I INPUT 1 -i vboxnet+ -p tcp -m tcp --dport 2049 -j ACCEPT
  '';

  # Add firewall exception for libvirt provider when using NFSv4 
  networking.firewall.interfaces."virbr1" = {                                   
    allowedTCPPorts = [ 2049 ];                                               
    allowedUDPPorts = [ 2049 ];                                               
  };     

}

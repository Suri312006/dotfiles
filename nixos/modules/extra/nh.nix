{ user, inputs, ... }: {
  programs.nh = {
    enable = true;
    package = inputs.nh.packages.x86_64-linux.default;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/${user}/dotfiles";
  };

}


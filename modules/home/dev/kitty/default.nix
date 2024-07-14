{ pkgs, lib, ... }: {
  programs.kitty = {
    enable = true;
    theme = "Monokai Pro (Filter Octagon)";
    font = {
      #   package = pkgs.fira-code;
        # name = "Fira Code SemiBold";
        package = lib.mkForce pkgs.monaspace;
        name = lib.mkForce "Monaspace Krypton Var Bold";
        size = lib.mkForce 10;
        weight = "Bold";
    };
    settings = {
      enable_audio_bell = "no";
      confirm_os_window_close = 0;
      window_padding_width = 4;
      startup_session = "launch.conf";
    };
  };

  #TODO: surely can make this better / inline
  home.file.".config/kitty/launch.conf".source = ./launch.conf;
  home.file.".config/fontcongfig/fonts.conf".source = "./fonts.conf";

  home.packages = [
    pkgs.yazi
  ];
}

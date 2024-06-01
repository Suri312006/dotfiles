{ pkgs, ... }: {
  programs.kitty = {
    enable = true;
    theme = "Monokai Soda";
    font = {
      package = pkgs.fira-code;
      name = "Fira Code SemiBold";
      size = 9.5;
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

}

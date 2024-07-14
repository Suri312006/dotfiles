{ pkgs, lib, ... }: {
  programs.kitty = {
    enable = true;
    theme = "Monokai Pro (Filter Octagon)";
    font = {
      #   package = pkgs.fira-code;
      # name = "Fira Code SemiBold";
      package = lib.mkForce pkgs.monaspace;
      name = lib.mkForce "MonaspaceKryptonVar_700wght";
      size = lib.mkForce 10.5;
    };
    settings = {
      enable_audio_bell = "no";
      confirm_os_window_close = 0;
      window_padding_width = 4;
      startup_session = "launch.conf";
    };
    extraConfig = ''
      font_features     MonaspaceKryptonVar_700wght +calt +liga +ss01 +ss02 +ss03 +ss04 +ss05 +ss06 +ss07 +ss08 +ss09
    '';
  };

  #TODO: surely can make this better / inline
  home.file.".config/kitty/launch.conf".source = ./launch.conf;
  home.file.".config/fontcongfig/fonts.conf".source = ./fonts.conf;

  home.packages = [
    pkgs.yazi
  ];
}

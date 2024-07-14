{ pkgs, ... }: {
  environment.variables = {
    # for compiling openssl for nixos, should refactor into a diff file later
    PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
  };

}

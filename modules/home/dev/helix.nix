{ pkgs, ... }: {
  programs.helix = {
    enable = true;

    settings = {
      editor.cursor-shape = {
        normal = "block";
        insert = "bar";
        select = "underline";
      };

      editor.line-number = "relative";
      editor.inline-diagnostics.cursor-line = "warning";
      editor.end-of-line-diagnostics = "hint";
    };

    languages.language = [{
      name = "nix";
      auto-format = true;
      formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
    }];
  };
}

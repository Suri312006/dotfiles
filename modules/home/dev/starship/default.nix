{ lib, ... }: {

  programs.starship = {
    enable = true;
    #   settings = lib.mkForce {
    #     "$schema" = "https://starship.rs/config-schema.json";

    #     format =
    #       "[](color_orange)$os$username[](bg:color_yellow fg:color_orange)$directory[](fg:color_yellow bg:color_aqua)$git_branch$git_status[](fg:color_aqua bg:color_blue)$c$rust$golang$nodejs$php$java$kotlin$haskell$python[](fg:color_blue bg:color_bg3)$docker_context$conda[](fg:color_bg3 bg:color_bg1)$time[ ](fg:color_bg1)$line_break$character";

    #     # Palette definition needs to be structured correctly
    #     palette = "gruvbox_dark";

    #     # Palettes need to be defined as a top-level key
    #     palettes = {
    #       gruvbox_dark = {
    #         color_fg0 = "#fbf1c7";
    #         color_bg1 = "#3c3836";
    #         color_bg3 = "#665c54";
    #         color_blue = "#458588";
    #         color_aqua = "#689d6a";
    #         color_green = "#98971a";
    #         color_orange = "#d65d0e";
    #         color_purple = "#b16286";
    #         color_red = "#cc241d";
    #         color_yellow = "#d79921";
    #       };
    #     };

    #     os = {
    #       disabled = false;
    #       style = "bg:color_orange fg:color_fg0";
    #       symbols = {
    #         Windows = "󰍲";
    #         Ubuntu = "󰕈";
    #         SUSE = "";
    #         Raspbian = "󰐿";
    #         NixOS = " ";
    #         Mint = "󰣭";
    #         Macos = "󰀵";
    #         Manjaro = "";
    #         Linux = "󰌽";
    #         Gentoo = "󰣨";
    #         Fedora = "󰣛";
    #         Alpine = "";
    #         Amazon = "";
    #         Android = "";
    #         Arch = "󰣇";
    #         Artix = "󰣇";
    #         EndeavourOS = "";
    #         CentOS = "";
    #         Debian = "󰣚";
    #         Redhat = "󱄛";
    #         RedHatEnterprise = "󱄛";
    #         Pop = "";
    #       };
    #     };

    #     username = {
    #       show_always = true;
    #       style_user = "bg:color_orange fg:color_fg0";
    #       style_root = "bg:color_orange fg:color_fg0";
    #       format = "[ $user ]($style)";
    #     };

    #     directory = {
    #       style = "fg:color_fg0 bg:color_yellow";
    #       format = "[ $path ]($style)";
    #       truncation_length = 4;
    #       truncation_symbol = "…/";
    #       substitutions = {
    #         Documents = "󰈙 ";
    #         Downloads = " ";
    #         Music = "󰝚 ";
    #         Pictures = " ";
    #         Developer = "󰲋 ";
    #       };
    #     };

    #     git_branch = {
    #       symbol = "";
    #       style = "bg:color_aqua";
    #       format = "[[ $symbol $branch ](fg:color_fg0 bg:color_aqua)]($style)";
    #     };

    #     git_status = {
    #       style = "bg:color_aqua";
    #       format =
    #         "[[($all_status$ahead_behind )](fg:color_fg0 bg:color_aqua)]($style)";
    #     };

    #     nodejs = {
    #       symbol = "";
    #       style = "bg:color_blue";
    #       format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
    #     };

    #     c = {
    #       symbol = " ";
    #       style = "bg:color_blue";
    #       format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
    #     };

    #     rust = {
    #       symbol = "";
    #       style = "bg:color_blue";
    #       format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
    #     };

    #     golang = {
    #       symbol = "";
    #       style = "bg:color_blue";
    #       format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
    #     };

    #     php = {
    #       symbol = "";
    #       style = "bg:color_blue";
    #       format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
    #     };

    #     java = {
    #       symbol = "";
    #       style = "bg:color_blue";
    #       format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
    #     };

    #     kotlin = {
    #       symbol = "";
    #       style = "bg:color_blue";
    #       format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
    #     };

    #     haskell = {
    #       symbol = "";
    #       style = "bg:color_blue";
    #       format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
    #     };

    #     python = {
    #       symbol = "";
    #       style = "bg:color_blue";
    #       format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)";
    #     };

    #     docker_context = {
    #       symbol = "";
    #       style = "bg:color_bg3";
    #       format = "[[ $symbol( $context) ](fg:#83a598 bg:color_bg3)]($style)";
    #     };

    #     conda = {
    #       style = "bg:color_bg3";
    #       format =
    #         "[[ $symbol( $environment) ](fg:#83a598 bg:color_bg3)]($style)";
    #     };

    #     time = {
    #       disabled = false;
    #       time_format = "%R";
    #       style = "bg:color_bg1";
    #       format = "[[  $time ](fg:color_fg0 bg:color_bg1)]($style)";
    #     };

    #     line_break = { disabled = false; };

    #     character = { disabled = false; };
    #   };
    # };
  };
}

{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ fish ];

  programs.fish = {

    enable = true;

    shellAliases = {
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../../";
      "....." = "cd ../../../../";

      "dot" = "cd ~/.dotfiles";
      "stor" = "cd /storage/FTP/";

      "cp" = "cp -v";
      "ddf" = "df -h";
      "etc" = "erd -H";
      "mkdir" = "mkdir -p";
      "mv" = "mv -v";
      "rm" = "rm -v";
      "rr" = "rm -rf";

      "ld" = "eza -ld */ --no-quotes --time-style long-iso";
      "lla" = "eza -lah --no-quotes --time-style long-iso";
      "ll" = "eza -lh --no-quotes --time-style long-iso";
      "llr" = "eza -lhr --no-quotes --time-style long-iso";
      "lls" = "eza -lh -s size --no-quotes --time-style long-iso";
      "llt" = "eza -lh -s time --no-quotes --time-style long-iso";
      "lltr" = "eza -lhr -s time --no-quotes --time-style long-iso";

      "ree" =
        "sudo nixos-rebuild switch --flake ~/dots/nixdots#zephryus && git push";

      "dots" = "z ~/dots";
      "fcd" = ''
        cd "$(find ~/coding/ ~/storage/ -type d -not \( -path "*/.git/*" -o -path "*/target/*" -o -path "*/.venv/*" -o -path "*/node_modules/*" -o -path "*/venv/*" -o -path "*/build/*" -o -path "*/.*/*" \) -print 2>/dev/null | fzf)" '';

      "l" = "exa";

      "lg" = "lazygit";
    };

    shellAbbrs = {
      # cargo abbreviations
      cb = "cargo build";
      cc = "cargo check";
      cdo = "cargo doc --open";
      cr = "cargo run";

      # git abbreviations
      gaa = "git add -A";
      ga = "git add";
      gbd = "git branch --delete";
      gb = "git branch";
      gc = "git commit";
      gcm = "git commit -m";
      gcob = "git checkout -b";
      gco = "git checkout";
      gd = "git diff";
      gl = "git log";
      gp = "git push";
      gpom = "git push origin main";
      gs = "git status";
      gst = "git stash";
      gstp = "git stash pop";

    };

    functions = {

      mkcd = ''
        function mkcd --argument name
        	mkdir -p $name
        	cd $name
        end
      '';
      re = ''
        function re
            set VERSION (math (readlink /nix/var/nix/profiles/system | grep -o "[0-9]*") + 1)
            z ~/dots/nixdots
            git add -A
            git commit -m "Generation: $VERSION"
            sudo nixos-rebuild switch --flake /home/suri/dots/nixdots#zephryus
            git push
        end
      '';
    };
  };
}

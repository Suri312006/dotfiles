{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ fish ];

  programs.fish = {

    enable = true;

    interactiveShellInit = ''
      set fish_greeting
      eval (ssh-agent -c) &> /dev/null
      ssh-add ~/.ssh/github_private &> /dev/null
      ssh-add ~/.ssh/ucsc_gitlab &> /dev/null
      ssh-add ~/.ssh/connectify &> /dev/null

      eval "$(zoxide init fish)"
      eval "$(starship init fish)"

    '';

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
      # function re
      #     set VERSION (math (readlink /nix/var/nix/profiles/system | grep -o "[0-9]*") + 1)
      #     z ~/dots/nixdots
      #     git add -A
      #     git commit -m "Generation: $VERSION"
      #     sudo nixos-rebuild switch --flake /home/suri/dots/nixdots#zephryus
      #     git push
      # end
      re = ''
        function re
            # Safely get version number
            set -l ver (math (readlink /nix/var/nix/profiles/system | grep -o "[0-9]*" 2>/dev/null; or echo 0) + 1)
            
            # Change directory with error handling
            cd ~/dots/nixdots; or begin
                echo "Failed to change directory to ~/dots/nixdots"
                return 1
            end
            
            # Check for changes before git operations
            if not git diff-index --quiet HEAD --
                git add -A
                git commit -m "Generation: $ver"; or begin
                    echo "Git commit failed"
                    return 1
                end
            end
            
            # NixOS rebuild with verbose output
            sudo nixos-rebuild switch --flake /home/suri/dots/nixdots#zephryus; or begin
                echo "NixOS rebuild failed"
                return 1
            end
            
            # Push changes
            git push; or begin
                echo "Git push failed"
                return 1
            end
        end        '';

      # function y
      #     set tmp (mktemp -t "yazi-cwd.XXXXXX")
      #     yazi $argv --cwd-file="$tmp"
      #     if test -s "$tmp"
      #         set cwd (cat -- "$tmp")
      #         if test -n "$cwd" -a "$cwd" != "$PWD"
      #             cd -- "$cwd"
      #         end
      #     end
      #     rm -f -- "$tmp"
      # end
      y = ''

        function y
            set -l tmp (mktemp -t "yazi-cwd.XXXXXX")
            yazi $argv --cwd-file="$tmp"
            
            # Add a small delay to ensure file is written
            sleep 0.1
            
            # More robust file checking
            if test -s "$tmp" && set -l cwd (cat -- "$tmp")
                if test -n "$cwd" -a "$cwd" != "$PWD"
                    cd -- "$cwd"
                end
            end
            
            # Ensure cleanup even if something goes wrong
            command rm -f -- "$tmp"
        end      '';

      tz = ''
        function tz
            if test (count $argv) -eq 0
                echo "Usage: tz <file.typ>"
                return 1
            end

            set input_file $argv[1]
            set output_file (string replace ".typ" ".pdf" -- $input_file)

            typst watch "$input_file" "$output_file" &  # Watch and compile Typst file
            sleep 1  # Give Typst some time to generate the PDF
            zathura "$output_file"  # Open the generated PDF
        end
      '';
    };
  };
}

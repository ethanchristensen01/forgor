#!/usr/bin/env fish
set -l _version "0.0.3"
set -x commands "help" "I forgor everything..."
source ./dictionary.fish

for file in (ls ./forgors/*.fish)
  source $file
end

function _completions
  dict_entries $commands
end

function _subcommands
  dict_keys $commands
end

function _help -a subcommand -d "Print human readable list of subcommands"
  if test -n "$subcommand"
    set -l description (dict_get $subcommand $commands)
    if test -n "$description"
      echo "    "$description
    else
      printf "Unknown subcommand: '%s'\n" $subcommand
      echo "Type 'forgor help' for usage."
    end
  else
    printf "forgor %s\n" $_version
    echo "Ethan Christensen <ethanchristensen01@gmail.com>"
    echo "A tool to aggregate mini commands"
    echo -e "\nUSAGE:"
    echo -e "    forgor <SUBCOMMAND>"
    echo -e "\nSUBCOMMANDS:"
    for pairstring in (dict_entries $commands)
      set -l cmd_desc (string split "::" $pairstring)
      printf '    %s%s\n' (string pad -r -w 16 --char '-' $cmd_desc[1]) $cmd_desc[2]
    end
  end
end

function forgor
  set -l subcommand "$argv[1]"
  switch $subcommand
      case ""
        _help
      case "help" "-h" "--help"
        _help $argv[2]
      case "_completions"
        _completions
      case "_subcommands"
        _subcommands
      case "*"
        # Check if subcommand is in commands list
        for compare_command in (dict_keys $commands)
          if test $subcommand = $compare_command
            forgor_$subcommand
            return
          end
        end
        echo "Unknown subcommand: '$subcommand'"
        echo "Type 'forgor help' for usage."
        return 1
  end
end

forgor $argv

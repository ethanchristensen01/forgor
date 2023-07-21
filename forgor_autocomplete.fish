#!/usr/bin/env fish

complete -c forgor -f

function __fish_forgor_generate_completions
  set -l subcommands forgor _subcommands
  set -l completions forgor _completions
  for completion in (forgor _completions)
      set -l cmd_desc (string split -m 1 "::" $completion)
      set -l cmd $cmd_desc[1]
      set -l desc $cmd_desc[2]
      complete -c forgor -n "__fish_use_subcommand" -f -a $cmd -d $desc
  end
  for cmd in (forgor _subcommands)
    complete -c forgor -n "__fish_seen_subcommand_from help" -f -a $cmd
  end
end


__fish_forgor_generate_completions
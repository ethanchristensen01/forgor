# name.fish
set -l subcommand (status basename | path change-extension '')
set -a commands $subcommand "What is my name?"

function forgor_$subcommand
  echo "Your name here"
end

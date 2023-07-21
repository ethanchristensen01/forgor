# phone_numbers.fish
set -l subcommand (status basename | path change-extension '')
set -a commands $subcommand "What phone numbers should I remember?"

function forgor_$subcommand
  set -f numbers \
    "Elmo"      "123-123-1234"\
    "The Count" "123-456-7890"
  
  for entry in (dict_entries $numbers)
    set -l name_number (string split "::" $entry)
    set -l name $name_number[1]
    set -l number $name_number[2]
    printf '    %s%s\n' (string pad -r -w 16 --char '-' $name) $number
  end
end

# Output: 
#     Elmo------------123-123-1234
#     The Count-------123-456-7890


# Forgor
A fish utility for remembering important things

## Setup
*TODO: I forgor how 💀*  
For temporary usage, you can `source ./register.fish` in your fish shell.

## Creating a custom command
*Note: Currently, only fish commands are supported.*

1. Pick a name for your custom command.
1. Copy the template from `./forgors/template.fish` to `./forgors/yourcommand.fish` and uncomment everything.
1. Change the command description on line 2. This will be displayed during fish autocompletions.
1. Put the commands you want to run inside of the forgor_$subcommand function.
1. In a fish shell, run `source ./forgor_autocomplete.fish`.

## Calling a custom command
*Don't forget to source ./register.fish. This makes the forgor funciton available.*
1. In a fish shell, type `forgor ` and press tab. You should see a list of commands you've created.
1. Run `forgor yourcommand`.

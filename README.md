# Forgor
**A fish utility for aggregating subcommands with autocompletions.**

I wrote this because I kept forgetting what I was supposed to be doing. I wanted a convenient way to make helper scripts without needing to remember all of their names or uses.

## Setup
I haven't tried setting this up for permanent use, but for now, you can `source ./register.fish` in your fish shell.

## Creating a custom command
*Note: Currently, only fish scripts are supported.*

1. Pick a name for your custom command.
1. Copy the template from `./forgors/template.fish` to `./forgors/yourcommand.fish` and uncomment everything.
1. Change the command description on line&nbsp;2. This will be displayed during fish autocompletions.
1. Put the commands you want to run inside of the `forgor_$subcommand` function.
1. In a fish shell, run `source ./forgor_autocomplete.fish`.

``

## Calling a custom command
*Don't forget to source ./register.fish. This makes the forgor funciton available.*
1. In a fish shell, type `forgor ` and press tab. You should see a list of commands you've created.
1. Run `forgor yourcommand`.

## ...
I forgor what comes next 💀
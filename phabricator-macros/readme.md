Keyboard Maestro macros for use with accepting (or commenting) on Phabricator diffs.

Setup:

- Create a [`.memes`](https://github.com/amyreese/dotfiles/blob/main/.memes) file
  in your home directory containing a list of preferred phabricator macros.

- Import the [macro group](https://github.com/amyreese/dotfiles/tree/main/keyboard-maestro)
  into Keyboard Maestro and make sure they are enabled.

- Install `shuf` via homebrew or other mechanism if it's not already available,
  and symlink it to `/usr/local/bin/shuf`, or modify the imported macros to update
  their path to `shuf` to point to the version you have installed (`which shuf`).

Usage:

- Ctrl - Shift - M: activate the comment field and insert a random macro from your `.memes`.

- Ctrl - Shift - S: activate the comment field, insert a random macro from your `.memes`,
  then mark the diff as accepted, and save/submit the results.

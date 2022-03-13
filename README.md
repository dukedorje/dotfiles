# dukejones does dotfiles

    Copied from the eminent holman dotfiles project

This project is topic-centric. I realized I could split a lot of things
up into the main areas I used (Ruby, git, system libraries, and so on), so I
structured the project accordingly.

## major changes from holman

- I added antigen as a minimal and amazing package installer for ZSH, with my favorite plugins.

- I added a Brewfile and shell script to run `brew bundle install`. It installs all the best homebrew packages for development.

- Also added asdf installation to manage all the versions of your language interpreter binaries such as nodejs, python, ruby, etc.

## topical

Everything's built around topic areas. If you're adding a new area to your
forked dotfiles — say, "Java" — you can simply add a `java` directory and put
files in there. Anything with an extension of `.zsh` will get automatically
included into your shell. Anything with an extension of `.symlink` will get
symlinked without extension into `$HOME` when you run `script/bootstrap`.

## what to do

[Fork it](https://github.com/dukejones/dotfiles/fork), remove what you don't
use, and build on what you do use.

## components

There's a few special files in the hierarchy.

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made
  available everywhere.
- **topic/\*.zsh**: Any files ending in `.zsh` get loaded into your
  environment.
- **topic/path.zsh**: Any file named `path.zsh` is loaded first and is
  expected to setup `$PATH` or similar.
- **topic/completion.zsh**: Any file named `completion.zsh` is loaded
  last and is expected to setup autocomplete.
- **topic/install.sh**: Any file named `install.sh` is executed when you run `script/install`. To avoid being loaded automatically, its extension is `.sh`, not `.zsh`.
- **topic/\*.symlink**: Any file ending in `*.symlink` gets symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `script/bootstrap`.

For antigen, I had to include all the plugins in one file, `antigen-packages`.zsh, in the zsh/ folder, because it needs an init, the plugins, then a command to tell it to finish. Otherwise the zshrc loads all .zsh files in alphabetical order.

## install

Run this:

```sh
git clone https://github.com/dukejones/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
script/bootstrap
# on mac
homebrew/install.sh
homebrew/install-brewfile.sh
asdf/install.sh
# for the very adventurous
macos/set-defaults.sh
```

This will symlink the appropriate files in `.dotfiles` to your home directory.
Everything is configured and tweaked within `~/.dotfiles`.

The main file you'll want to change right off the bat is `zsh/zshrc.symlink`,
which sets up a few paths that'll be different on your particular machine.

`dot` is a simple script that installs some dependencies, sets sane macOS
defaults, and so on. Tweak this script, and occasionally run `dot` from
time to time to keep your environment fresh and up-to-date. You can find
this script in `bin/`.

## bugs

I want this to work for everyone; that means when you clone it down it should
work for you even though you may not have `rbenv` installed, for example. That
said, I do use this as _my_ dotfiles, so there's a good chance I may break
something if I forget to make a check for a dependency.

If you're brand-new to the project and run into any blockers, please
[open an issue](https://github.com/dukejones/dotfiles/issues) on this repository
and I'd love to get it fixed for you!

## thanks

Of course [holman](https://github.com/holman/dotfiles/issues) the original.

Also [bynen](https://github.com/mathiasbynens/dotfiles) is _very_ detail oriented but I got the macos `set-defaults.sh` magic from him.

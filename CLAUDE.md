# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Is

A topic-centric dotfiles manager for macOS/zsh, forked from holman/dotfiles. Each top-level directory is a "topic" (git, ruby, zsh, system, etc.).

## Key Commands

- `./bootstrap` — Initial setup: prompts for git author info, symlinks all `*.symlink` files to `$HOME`, installs Homebrew on macOS
- `./install` — Runs every `install.sh` script found in the repo (interactive, asks for confirmation)
- `homebrew/install-brewfile.sh` — Installs packages from `homebrew/Brewfile` via `brew bundle install`
- `macos/set-defaults.sh` — Applies macOS system defaults
- `. ~/.zshrc` or `reload!` alias — Reload shell config after changes

## Architecture: File Loading Convention

The shell loads files from `zsh/zshrc.symlink` (symlinked to `~/.zshrc`) in this order:

1. **`topic/path.zsh`** — Loaded first; sets up `$PATH`
2. **All other `*.zsh` files** — Loaded next (excluding path.zsh and completion.zsh), sourced from `$DOTFILES/**/*.zsh`
3. **`antigen apply`** — Called in zshrc.symlink after all .zsh files load
4. **`topic/completion.zsh`** — Loaded last, after `compinit`

The glob pattern in zshrc.symlink collects all `.zsh` files: `$DOTFILES/zsh/lib/*.zsh` and `$DOTFILES/**/*.zsh`.

## Antigen (ZSH Plugin Manager)

Configured in `zsh/antigen-packages.zsh`. The antigen init, bundle declarations, and `antigen apply` must all be in one file because zshrc loads `.zsh` files alphabetically. A second `antigen apply` is called in `zsh/zshrc.symlink` after all files are sourced.

To reset antigen packages: `rm -rf ~/.antigen`

## Symlink Convention

Files named `*.symlink` get symlinked to `$HOME/.{name}` (without the `.symlink` extension). The `bootstrap` script handles this via `find -maxdepth 2 -name '*.symlink'`.

## Key Directories

- **`bin/`** — Added to `$PATH`; contains utilities like `e` (editor shortcut), `dns-flush`, `docker-nuke`
- **`functions/`** — Autoloaded zsh functions (via `autoload -U`); includes `extract`, `sst`
- **`zsh/helpers.zsh`** — Shell helper functions: `pack` (fzf package.json script runner), `clean-projects`, `upload-plex`, media compression utilities
- **`helpers.zsh`** (root) — `alias_edit` function for interactive alias editing via fzf

## Environment

- Default editor: Zed (`/usr/local/bin/zed`)
- Private env vars go in `~/.env` (sourced if present, not committed)
- Git config locals go in `git/gitconfig.local.symlink` (generated from `.example` by bootstrap)
- Encrypted secrets: `~/.secret.env.gpg` loaded via `load-secret-env` function

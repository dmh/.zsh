# Zsh Configuration

A performant, modern ZSH setup with lazy-loading, cached completions, and optional custom git-aware prompt.

## Installation

1. Clone this repository to your home directory:
   ```bash
   git clone https://github.com/dmh/.zsh ~/.zsh
   ```

2. Copy `.zshenv` to the root of your home directory:
   ```bash
   cp ~/.zsh/copy_to_user_root/.zshenv ~/
   ```

3. Clone the prompt repository (optional) [zsh-prompt](https://github.com/dmh/zsh-prompt):
   ```bash
   git clone https://github.com/dmh/zsh-prompt ~/zsh-prompt
   ```

4. Restart your terminal or run:
   ```bash
   source ~/.zshrc
   ```

## Features

### Performance Optimizations
- **Lazy-loaded NVM** - Shell startup reduced from ~500ms to ~50ms
- **Cached completions** - `compinit` only regenerates once per day
- **Deduplicated PATH** - Prevents PATH bloat across sessions

### History
- 10,000 entries with timestamps
- Shared across all terminal sessions
- Commands starting with space are ignored (for sensitive commands)
- Duplicate removal and smart search

### Completions
- Case-insensitive matching
- Menu selection with arrow keys
- Partial-word and substring completion

### Key Bindings
- Proper terminal application mode for consistent behavior

## Structure

```
~/.zsh/
├── .zshrc              # Main configuration
├── .zsh_aliases        # Shared aliases
├── .zsh_path_example    # Example PATH configuration
└── copy_to_user_root/
    └── .zshenv         # Sets ZDOTDIR
```

## Local Customization

Create `~/.zsh_aliases.local` for machine-specific aliases (not tracked by git).

Copy `.zsh_path_example` to `.zsh_path_local` for machine-specific PATH entries.
The local file is ignored by git.

## Dependencies

- [zsh-prompt](https://github.com/dmh/zsh-prompt) - Custom git-aware prompt
- NVM (optional) - Node version manager
- Bun (optional) - JavaScript runtime

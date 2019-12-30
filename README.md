# Quitup

**Qui**ck Se**tup** is a tool to fast install all my everday linux dependencies.

## Setup Contains
- vim
- zsh

## Usage

```sh
python ./quitup.py setup --vim
python ./quitup.py upload --all
```

### Commands

#### `addalias <dest = '~/.zshrc'>`
Adds alias for **Quitup** in the destination bash 
```bash
alias quitup='<repo_dir>/quitup.py'
```

#### `setup`

- `--vim` - installs and configures **vim**
- `--zsh` - installs and configures **oh-my-zsh** & bash scripts/shortcuts
- `--all` - installs and configures everything

#### `upload`

- `--vim` - uploads all local **vim** changes to git
- `--zsh` - uploads all local **zsh** changes to git
- `--all` - uploads all local changes

## Requirements

- **python3**
- **Linux** - Manjaro **or** Ubuntu
    
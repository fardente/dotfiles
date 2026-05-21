# dotfiles
Managed using [chezmoi](https://www.chezmoi.io/)

## Usage

```sh
chezmoi init --apply <repo-url>
```

## Requirements for terminal stuff
- [zsh](https://wiki.archlinux.org/title/zsh)
- [powerlevel10](https://github.com/romkatv/powerlevel10k) (zsh prompt theme)
- [fzf](https://github.com/junegunn/fzf) cli fuzzy finder
- [fd](https://github.com/sharkdp/fd) instead of find for instant search results with fzf
- [ripgrep](https://github.com/BurntSushi/ripgrep) rg - instant grepping
- [alacritty](https://github.com/alacritty/alacritty) RGB Terminal
- [tmux](https://github.com/tmux/tmux/wiki) terminal multiplexer
- [bat](https://github.com/sharkdp/bat) A cat clone with syntax highlighting and Git integration

## Optional extras
- [conky](https://github.com/brndnmtthws/conky) customisable system monitor — `.config/conky/` is shipped but conky won't run until you start it.
- `.cmc.py` needs an API key for coinmarketcap; runs as a cron job to fetch BTC price for conky. The file is shipped but inert until wired up:

  `*/5 * * * * /usr/bin/python /home/username/.cmc.py`

## Distroboxes

Two [distrobox](https://distrobox.it/) containers are defined under `~/.config/distrobox/`:

- **`dev`** — Fedora toolbox (matches host Fedora version). Daily-driver CLI tools: `kubectl`, `helm`, `k9s`, `neovim`, `gh`, `jq`. These binaries are exported to `~/.local/bin/` so they work transparently from the host shell — no `distrobox enter` prefix needed. (`git` lives on the host already and the config in `~` is bind-mounted into the box, so no need to duplicate it.)
- **`aur`** — Arch escape hatch with `base-devel`, `git`, and `yay`. Nothing exported by default; only enter manually when something forces you to AUR.

### First-time setup

```sh
setup-devboxes
```

Idempotent — re-running with existing boxes is a no-op (manifests use `replace=false`).

### Useful commands

```sh
# Enter a box interactively
distrobox enter dev
distrobox enter aur

# Run a one-off command in a box without entering
distrobox enter dev -- kubectl get pods       # though kubectl is exported, so just: kubectl get pods

# Recreate a box from scratch (after editing a manifest)
distrobox rm dev && setup-devboxes

# List boxes
distrobox list

# Stop a running box
distrobox stop dev

# Export a binary from a box to the host PATH (~/.local/bin)
distrobox enter aur -- distrobox-export --bin /usr/bin/<name> --export-path ~/.local/bin

# Export a GUI app's .desktop entry to the host application menu
distrobox enter <box> -- distrobox-export --app <name> --export-label box

# Unexport a previously exported binary or app
distrobox enter <box> -- distrobox-export --bin /usr/bin/<name> --export-path ~/.local/bin --delete
distrobox enter <box> -- distrobox-export --app <name> --delete

# Install something inside the dev box (e.g. extra tooling not in the manifest)
distrobox enter dev -- sudo dnf install <pkg>

# Install something from AUR
distrobox enter aur -- yay -S <pkg>
```

### Adding a new tool to the dev box

1. Edit `~/.config/distrobox/dev.ini` — add the package name to `additional_packages` and (if it's a CLI tool you want on the host PATH) the binary path to `exported_bins`.
2. Recreate: `distrobox rm dev && setup-devboxes`.

If the tool was only added ad-hoc via `distrobox enter dev -- sudo dnf install` and not in the manifest, it'll be lost on the next recreate. The manifest is the source of truth.

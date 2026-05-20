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

# dotfiles
Managed using [chezmoi](https://www.chezmoi.io/)

Requirements for terminal stuff:
- [zsh](https://wiki.archlinux.org/title/zsh)
- [powerlevel10](https://github.com/romkatv/powerlevel10k) (zsh prompt theme)
- [fzf](https://github.com/junegunn/fzf) cli fuzzy finder
- [fd](https://github.com/sharkdp/fd) instead of find for instant search results with fzf
- [ripgrep](https://github.com/BurntSushi/ripgrep) rg - instant grepping
- [alacritty](https://github.com/alacritty/alacritty) RGB Terminal
- [tmux](https://github.com/tmux/tmux/wiki) terminal multiplexer
- [astronvim](https://astronvim.github.io/) for use with user/init.lua
- [bat](https://github.com/sharkdp/bat) A cat clone with syntax highlighting and Git integration
---
Other stuff:
- Capslock is mapped to ESC (press once) / CTRL (keep pressed)
- [conky](https://github.com/brndnmtthws/conky) customisable system monitor
- cmc.py needs API key for coinmarketcap, can be run as cron job to fetch BTC price to be shown in conky \
  e.g. fetch BTC price every 5 mins using `crontab -e` : 
  
  `*/5 * * * * /usr/bin/python /home/username/cmc.py` 

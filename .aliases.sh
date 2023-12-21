alias refresh='source ~/.zshrc'

# package management using paru
alias get='paru -S --skipreview'
alias gets='paru'
alias yeet='paru -R'
alias upgrade='paru -Syuv'

# vim
alias v='nvim'
alias vim='v'

# git
alias lg='lazygit'

# open dotfiles
alias aliases='v ~/.aliases.sh'
alias exports='v ~/.exports.sh'
alias scripts='v ~/.scripts.sh'
alias sources='v ~/.sources.sh'

# open configs
alias i3config='v ~/.config/i3/config'
alias vconfig='v ~/.config/nvim'
alias barconfig='v ~/.config/polybar/config.ini'
alias pconfig='v ~/.config/picom/picom.conf'
alias dconfig='v ~/.config/dunst/dunstrc'
alias zshconfig='v ~/.zshrc'

# for keyboard
alias keymap='v ~/personal/lily58-zmk-config/config/lily58.keymap'
alias keeb_dl='. ~/personal/lily58-zmk-config/download.sh'
alias keeb_in='. ~/personal/lily58-zmk-config/install.sh'
alias keeb_up='keeb_dl && keeb_in'

# runtimes
alias arst='asdf'

# yadm management
alias yadma='yadm add -u'
alias yadmm='yadm commit -m'
alias yadmp='yadm push'

# vpn
alias vpn='pritunl-client'
alias vl='vpn list'

# yarn
alias y='yarn'

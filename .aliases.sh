alias refresh='source ~/.zshrc'

# package management using paru
alias get='paru -S --skipreview'
alias gets='paru'
alias yeet='paru -R'
alias pup='paru -Syuv'
alias pups='paru -Syuuv'

# vim
alias vim='nvim'
alias v='vim'
alias vcacheclean='rm ~/.local/state/nvim/swap/*'

# git
alias lg='lazygit'

# open dotfiles
alias aliases='v ~/.aliases.sh'
alias exports='v ~/.exports.sh'
alias scripts='v ~/.scripts.sh'
alias sources='v ~/.sources.sh'

# set a background
alias bgpick='rg --files ~/Pictures/w | peco'
alias setbg='feh --bg-max $(bgpick)'
alias bg='feh --bg-max $(bgpick)'

# open configs
alias i3config='v ~/.config/i3/config'
alias vconfig='cd ~/.config/nvim && v && cd -'
alias bconfig='v ~/.config/polybar/config.ini'
#alias pconfig='v ~/.config/picom/picom.conf'
alias cconfig='v ~/.config/compfy.conf'
alias dconfig='v ~/.config/dunst/dunstrc'
alias lgconfig='v ~/.config/lazygit/config.yml'
alias wconfig='v ~/.wezterm.lua'
alias zconfig='v ~/.zshrc'

# for keyboard
# alias keymap='cd ~/personal/lily58-zmk-config/config/lily58.keymap; v ~/personal/lily58-zmk-config/config/lily58.keymap'
# alias keymap='cd ~/personal/lily58-zmk-config/config/lily58.keymap; v ~/personal/lily58-zmk-config/config/lily58.keymap'
# alias keeb_dl='. ~/personal/lily58-zmk-config/download.sh'
# alias keeb_in='. ~/personal/lily58-zmk-config/install.sh'
alias keymap='cd ~/personal/solfe-zmk-config; v ~/personal/solfe-zmk-config/config/sofle.keymap'

# runtimes (used to use asdf, but mise is better)
alias arst='mise'

# yadm management
alias yadma='yadm add -u'
alias yadmc='yadm commit -m'
alias yadms='yadm status'
alias yadmp='yadm push'

# vpn
alias vpn='pritunl-client'
alias vl='vpn list'

# yarn
alias y='yarn'
alias yl='yarn lint'
alias yl='yarn lint'
alias yt='yarn test'
alias ytu='yarn test -u'
alias ytc='yarn typecheck'
alias ye='yarn env'
alias ydw='yarn dev:web'
alias yqg='yarn qg'
alias ysm='yarn start:mobile --resetCache'
alias yp='yarn specs'
alias ypu='yarn specs:ui'

# call timesheet.sh
alias timesheet="timesheet.sh"
alias wat="watson"

# autorandr
alias ara="autorandr"

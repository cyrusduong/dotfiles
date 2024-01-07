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

# open configs
alias i3config='v ~/.config/i3/config'
alias vconfig='v ~/.config/nvim'
alias bconfig='v ~/.config/polybar/config.ini'
#alias pconfig='v ~/.config/picom/picom.conf'
alias cconfig='v ~/.config/compfy.conf'
alias dconfig='v ~/.config/dunst/dunstrc'
alias wconfig='v ~/.wezterm.lua'
alias zconfig='v ~/.zshrc'

# for keyboard
# alias keymap='v ~/personal/lily58-zmk-config/config/lily58.keymap'
# alias keymap='v ~/personal/lily58-zmk-config/config/lily58.keymap'
# alias keeb_dl='. ~/personal/lily58-zmk-config/download.sh'
# alias keeb_in='. ~/personal/lily58-zmk-config/install.sh'
alias keymap='v ~/personal/corne-zmk-config/config/corne.keymap'
alias keeb_dl='. ~/personal/corne-zmk-config/download.sh'
alias keeb_in='. ~/personal/corne-zmk-config/install.sh'
alias keeb_up='keeb_dl && keeb_in'

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

# call timesheet.sh
alias timesheet="timesheet.sh"

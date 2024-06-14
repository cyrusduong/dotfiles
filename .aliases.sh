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
alias pconfig='v ~/.config/picom/picom.conf'
# alias cconfig='v ~/.config/compfy.conf'
alias dconfig='v ~/.config/dunst/dunstrc'
alias lgconfig='v ~/.config/lazygit/config.yml'
alias wconfig='v ~/.wezterm.lua'
alias zconfig='v ~/.zshrc'

# for keyboard
# alias keymap='cd ~/personal/lily58-zmk-config/config/lily58.keymap; v ~/personal/lily58-zmk-config/config/lily58.keymap'
# alias keymap='cd ~/personal/lily58-zmk-config/config/lily58.keymap; v ~/personal/lily58-zmk-config/config/lily58.keymap'
alias keeb_dl='. ~/personal/solfe-zmk-config/download.sh'
alias keeb_in='. ~/personal/solfe-zmk-config/install.sh'
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
alias ys='yarn start'
alias ysm='yarn start:mobile --resetCache'
alias ysp='yarn specs'
alias yspu='yarn specs:ui'
alias yca='yarn clean:android'
alias ycp='yarn codepush:android:development && yarn codepush:android:staging && yarn codepush:ios:development && yarn codepush:ios:staging'
alias ycpprod='yarn codepush:android:production && yarn codepush:ios:production'
alias yva='yarn veracode:archive'

# pnpm
alias pn='pnpm'

# helper to bundle our codes for the veracodes
alias vvcode='wd admw && cd .. && rm *.tgz; wd ad && yva && wd l && yva && wd fp && yva'

# call timesheet.sh
alias timesheet="timesheet.sh"
alias wat="watson"

# autorandr
alias ara="autorandr"

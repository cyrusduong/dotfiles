alias fullrefresh="source ~/.zshrc"
alias refresh="source ~/.aliases.sh"
alias restart="sudo reboot now"

alias ff="firefox"

alias vim="nvim"
alias v="vim"
alias v.="vim ."
alias v.="vim ."
alias vkeymap="vim ~/.config/nvim/lua/config/keymaps.lua"
# Clean swap for nvim (use carefully after reboot and review files)
alias vrmswp="rm ~/.local/state/nvim/swap/*"

alias aliases="vim ~/.aliases.sh"
alias exports="vim ~/.exports.sh"
alias scripts="vim ~/.scripts.sh"
alias startup="vim ~/.startup.sh"
alias i3config="vim ~/.config/i3/config"
alias vconfig="vim ~/.config/nvim"
alias nvimconfig="vim ~/.config/nvim"
alias zshconfig="vim ~/.zshrc"
alias barconfig="vim ~/.config/polybar/config.ini"
alias dunstconfig="vim ~/.config/dunst/dunstrc"
alias keymap="wd l && v ./config/lily58.keymap"

# hacky way to remove all yarn.locks from cwd
alias rmyl="fd --hidden --no-ignore --full-path 'yarn\.lock' ./ --exec rm -rf '{}' +"
# hacky way to remove node_modules from cwd
#alias rmnm="fd --hidden --no-ignore --type=d --full-path node_modules ./ --exec rm -rf '{}' +"
alias rmnm="pnpm exec rm -rf node_modules"
# HACKY way to fresh install node_modules from cwd
#alias yy="yarn lerna clean -y && y"
alias yy="rmnm && y"
alias yyy="rmyl && rmnm && y"

# Cleanup metro bundler cache
alias rmyc="rm -rf /tmp/metro-cache/* /tmp/metro-file-map-*"

# git reset origin/HEAD --hard
alias grohh="git reset origin/HEAD --hard"

alias lg="lazygit"
alias lgconfig="vim ~/.config/lazygit/config.yml"

alias y="yarn"
alias ys="yarn start"
alias ysw="yarn start:web"
alias ybw="yarn build:web"
alias yp="yarn preview"
alias ye="yarn env"
alias ysm="yarn start:mobile"
alias ysmr="yarn start:mobile --reset-cache"
alias ysr="yarn start --reset-cache"
alias ysi="yarn start:image"
alias yl="yarn lint"
alias yp="yarn prettier"
alias yt="yarn test"
alias ytu="yarn test -u"
alias ylt="yl && yt"
alias ya="yarn android"
alias yi="yarn ios"
alias yb="yarn build"
alias yd="yarn dev"
alias yfd="yarn fix-dependencies"
alias yc="yarn clean"
alias ycd="yarn check-dependencies"
alias yui="yarn upgrade-interactive"
alias yul="yarn upgrade-interactive --latest"
alias yqg="yarn qg"

# aws-vault
alias av="aws-vault"

alias admw="wd admw"
alias fp="wd fp"
alias lms="wd lms"

# starts the stack of web-monorepo for web development
alias ss="wd esb && rmnm && pi && pb && adw && ps"
# dev lib
alias dl="wd esb && nx dev arrival-departure-lib"
# dev web
alias dw="wd esb && nx dev arrival-departure-web"
# start metro
alias sm="wd esb && nx start arrival-departure-lib"

# clean lib
alias cleanlib="wd esb && nx run arrival-departure-lib:clean"
# build lib
alias buildlib="cl && wd esb && nx run arrival-departure-lib:build"
# build android
alias buildandroid="bl && wd esb && nx run arrival-departure-lib-example:bundle:android && nx run arrival-departure-lib-example:fastlane:android:staging"
# codepush android
alias cpa="wd esb && nx run arrival-departure-lib:codepush:android:staging"
# build ios
alias buildios="bl && wd esb && nx run arrival-departure-lib-example:bundle:ios && nx run arrival-departure-lib-example:fastlane:ios:staging"
# codepush ios
alias cpios="wd esb && nx run arrival-departure-lib:codepush:ios:staging"

alias vpn="pritunl-client"
alias vl="vpn list"

alias n="npm"

alias pn="pnpm"
alias pi="pnpm install"
alias pb="pnpm build"
alias pnx="pnpm dlx"
alias pnpmx="pnx"
alias px="pnx"
alias ps="pnpm start"
alias pd="pnpm dev"
alias psr="pnpm start --reset-cache"
alias pl="pnpm lint"
alias pql="pnpm qg:lint"
alias pqlf="pnpm qg:lint --fix"
alias pt="pnpm test"
alias pqt="pnpm qg:test"
alias ptu="pnpm test -- -u"
alias plt="pl && pt"
alias pa="pnpm android"
alias pios="pnpm ios"

## Cleanup modules and force install
alias pp="rmnm && pnpm install"

alias pm="podman"

alias b="bun"
alias bi="bun install"

# https://asdf-vm.com/
alias arst="asdf"

# Watch cpu speeds
alias corespeed='watch -n.1 "grep \"^[c]pu MHz\" /proc/cpuinfo"'

# fzf
alias f="fzf"

# open my notebook
alias notebook="vim ~/notebook/"

# rm -rf
alias rmrf="rm -rf"

# wd aliaeses
alias esb="wd esb"
alias vesb="wd esb && v ."
alias adl="wd adl"
alias sc="wd sc"
alias adw="wd adw"

# bashtop
alias btop="bashtop"

# alias to touch a file at a given path and make missing dirs if needed
function touchp() {
	/bin/mkdir -p "$(dirname "$1")/" && /usr/bin/touch "$1"
}

# alias aws-docker-ecr="aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 026687314229.dkr.ecr.us-west-2.amazonaws.com"
alias aws-docker-ecr="aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 031289914581.dkr.ecr.us-west-2.amazonaws.com"

alias 2mon="autorandr 2mon && i3-msg restart"
alias 3mon="autorandr 3mon && i3-msg restart"
alias 4mon="autorandr 4mon && i3-msg restart"
alias macmode="autorandr macmode && i3-msg restart"

# React native/android SDK
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:/opt/rn-debugger/

# Rust source
source "$HOME/.cargo/env"

# NVM source
source "$HOME/.nvm/nvm.sh"

# Import HOME bin
export PATH=$PATH:$HOME/.bin

# Set my editor for the shell
# export EDITOR="nvim"

export DENO_INSTALL="/home/cduong/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
export AWS_DEFAULT_REGION="us-west-2"

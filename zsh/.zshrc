export PS1="[%n@%m %1~]# "; clear;

# Config
export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
export JAVA_11_HOME=$(/usr/libexec/java_home -v11)
export JAVA_17_HOME=$(/usr/libexec/java_home -v17)
export JAVA_21_HOME=$(/usr/libexec/java_home -v21)

alias java8='export JAVA_HOME=$JAVA_8_HOME'
alias java11='export JAVA_HOME=$JAVA_11_HOME'
alias java17='export JAVA_HOME=$JAVA_17_HOME'
alias java21='export JAVA_HOME=$JAVA_21_HOME'

# Set default to Java 17
java17

export ANDROID_HOME=~/Library/Android/sdk
export PATH=$PATH:$HOME/Developer/flutter/bin
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
export PATH=$PATH:$JAVA_HOME/bin
export PATH=$PATH:$HOME/.pub-cache/bin
export PATH=$PATH:$HOME/.local/scripts
export PATH=$PATH:/usr/local/opt/llvm/bin

# Android studio
export PATH=$PATH:"/Applications/Android Studio.app/Contents/MacOS"

bindkey -s ^f "tmux-sessionizer\n"

function emulator { ( cd "$(dirname "$(whence -p emulator)")" && ./emulator "$@"; ) }

alias vi="nvim"
alias vim="nvim"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export DEVKITPRO=/opt/devkitpro
export DEVKITARM=$DEVKITPRO/devkitARM
export LIBGBA=$DEVKITPRO/libgba
export PATH=$PATH:$DEVKITPRO/tools/bin:$DEVKITARM/bin


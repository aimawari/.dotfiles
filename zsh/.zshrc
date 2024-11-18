export JAVA_HOME=/usr/libexec/java_home
export ANDROID_HOME=~/Library/Android/sdk

export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
export PATH=$PATH:$JAVA_HOME/bin
export PATH=$PATH:$HOME/.pub-cache/bin
export PATH=$PATH:$HOME/.local/scripts
export PATH="/usr/local/opt/llvm/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && \. "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
[ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

bindkey -s ^f "tmux-sessionizer\n"

function emulator { ( cd "$(dirname "$(whence -p emulator)")" && ./emulator "$@"; ) }

alias vi="nvim"
alias vim="nvim"

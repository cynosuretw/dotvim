# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
if [[ `uname` == "Darwin" ]]; then
    ZSH_THEME="powerlevel10k/powerlevel10k"
else
    ZSH_THEME="robbyrussell"
fi

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent identities id_rsa alpha1-build

plugins=(git zsh-completions ssh-agent)
autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh
#source $HOME/dotvim/p10k-robbyrussell.zsh

# User configuration

export PATH="$HOME/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:$HOME/script/:/sbin/"
export GOPATH=$HOME/code/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
export PATH=$PATH:~/.local/bin
# export MANPATH="/usr/local/man:$MANPATH"
export PATH=$PATH:$HOME/.cargo/bin:

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
unsetopt share_history
alias au="!git add %(git ls-files -o --exclude-standard)"
alias lu="git ls-files -o --exclude-standard"
zstyle :omz:plugins:ssh-agent agent-forwarding on
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/
export M2_HOME=/usr/share/maven
export PATH=${M2_HOME}/bin:${PATH}
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
#alias pbcopy='xsel --clipboard --input'
#alias pbpaste='xsel --clipboard --output'
export PROMPT="%{$fg[white]%}%n@%{$fg[green]%}%m%{$reset_color%} ${PROMPT}"
RPROMPT="%{$fg[white]%}[%D{%y/%m/%f}|%@]"

# TMATE Functions

TMATE_PAIR_NAME="$(whoami)-pair"
TMATE_SOCKET_LOCATION="/tmp/tmate-pair.sock"
TMATE_TMUX_SESSION="/tmp/tmate-tmux-session"

# Get current tmate connection url
tmate-url() {
url="$(tmate -S $TMATE_SOCKET_LOCATION display -p '#{tmate_ssh}')"
echo "$url" | tr -d '\n' | pbcopy
echo "Copied tmate url for $TMATE_PAIR_NAME:"
echo "$url"
}



# Start a new tmate pair session if one doesn't already exist
# If creating a new session, the first argument can be an existing TMUX session to connect to automatically
tmate-pair() {
if [ ! -e "$TMATE_SOCKET_LOCATION" ]; then
    tmate -S "$TMATE_SOCKET_LOCATION" -f "$HOME/.tmate.conf" new-session -d -s "$TMATE_PAIR_NAME"

    while [ -z "$url" ]; do
        url="$(tmate -S $TMATE_SOCKET_LOCATION display -p '#{tmate_ssh}')"
    done
    tmate-url
    sleep 1

    if [ -n "$1" ]; then
        echo $1 > $TMATE_TMUX_SESSION
        tmate -S "$TMATE_SOCKET_LOCATION" send -t "$TMATE_PAIR_NAME" "TMUX='' tmux attach-session -t $1" ENTER
    fi
fi
tmate -S "$TMATE_SOCKET_LOCATION" attach-session -t "$TMATE_PAIR_NAME"
}



# Close the pair because security
tmate-unpair() {
if [ -e "$TMATE_SOCKET_LOCATION" ]; then
    if [ -e "$TMATE_SOCKET_LOCATION" ]; then
        tmux detach -s $(cat $TMATE_TMUX_SESSION)
        rm -f $TMATE_TMUX_SESSION
    fi

    tmate -S "$TMATE_SOCKET_LOCATION" kill-session -t "$TMATE_PAIR_NAME"
    echo "Killed session $TMATE_PAIR_NAME"
else
    echo "Session already killed"
fi
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [[ `uname` == "Darwin" ]]; then
    #source $ZSH_CUSTOM/os/mac.zsh
    export PATH=$PATH:/Applications/VMware\ OVF\ Tool/
    # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
    [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
    typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

    export PATH="/usr/local/opt/llvm@11/bin:$PATH"
    if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
fi

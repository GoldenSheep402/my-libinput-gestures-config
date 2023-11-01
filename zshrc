# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="Soliah"
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
        git
        zsh-syntax-highlighting
        zsh-autosuggestions
    )


source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#export https_proxy=http://127.0.0.1:7890;
#export http_proxy=http://127.0.0.1:7890;

alias bs="java -jar /home/goldensheep/software/burpsuite_pro_v2023.2.2/Loader.jar"
alias ll="ls -lahF --color=auto --time-style=long-iso"
alias av="source ./venv/bin/activate"
alias dnsrecon="/home/goldensheep/Hacking/Tools/dnsrecon/dnsrecon.py"
alias cls="clear"





## SSS_CUSTOM_SNIPPET: proxys
## Status: true
# easily change the shell proxys
export ipOfClash="127.0.0.1"
export portOfClash="7890"
export protoOfClash="http"

proxys(){
    case "$1" in
        h)
            echo "                                    "
            echo "==============usage================="
            echo "$0 [command] [params]"
            echo "=============command================"
            echo "set url               set the url like http://127.0.0.1:7890"
            echo "ip proxy_ip           import ip temply"
            echo "port port_id          import port temply"
            echo "mode protocol_header  like http socks socks5"
            echo "loc                   import localhost "
            echo "on                    open the cli proxy"
            echo "off                   close the proxy"
            echo "*                     show proxy & help"
            echo "h/help                show help"
            echo "===================================="
        ;;
        set)
            export ClashURL="$2"
            if [[ -n "${ClashURL}" ]]
            then
                export ipOfClash=$(echo $ClashURL|awk -F '://' '{print $2}'|awk -F ':' '{print $1}')
                export portOfClash=$(echo $ClashURL|awk -F '://' '{print $2}'|awk -F ':' '{print $2}')
                if [[ -z "${portOfClash}" ]]
                then
                    export portOfClash="80"
                fi
                export protoOfClash=$(echo $ClashURL|awk -F '://' '{print $1}')
            fi
        ;;
        mode)
            export protoOfClash="$2"
        ;;
        ip)
            export ipOfClash="$2"
        ;;
        port)
            export portOfClash="$2"
        ;;
        loc)
            export protoOfClash="socks5"
            export ipOfClash="127.0.0.1"
            export portOfClash="7890"
            $0 on
        ;;
        on)
            export https_proxy=$protoOfClash://$ipOfClash:$portOfClash \
            http_proxy=$protoOfClash://$ipOfClash:$portOfClash \
            all_proxy=$protoOfClash://$ipOfClash:$portOfClash && \
            echo 'export clash complete' && $0 show
        ;;
        off)
            unset https_proxy http_proxy all_proxy && echo 'unset clash complete'
        ;;
        help)
            proxys h
        ;;
        *)
            echo "We will show the proxy configs, If not other ouput ,there is no proxy"
            export|grep proxy
        ;;
    esac
}

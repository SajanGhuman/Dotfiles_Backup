# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/

# Path to powerlevel10k theme
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# List of plugins used
plugins=(git sudo zsh-256color zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# In case a command is not found, try to find the package that has it
function command_not_found_handler {
    local purple='\e[1;35m' bright='\e[0;1m' green='\e[1;32m' reset='\e[0m'
    printf 'zsh: command not found: %s\n' "$1"
    local entries=( ${(f)"$(/usr/bin/pacman -F --machinereadable -- "/usr/bin/$1")"} )
    if (( ${#entries[@]} )) ; then
        printf "${bright}$1${reset} may be found in the following packages:\n"
        local pkg
        for entry in "${entries[@]}" ; do
            local fields=( ${(0)entry} )
            if [[ "$pkg" != "${fields[2]}" ]] ; then
                printf "${purple}%s/${bright}%s ${green}%s${reset}\n" "${fields[1]}" "${fields[2]}" "${fields[3]}"
            fi
            printf '    /%s\n' "${fields[4]}"
            pkg="${fields[2]}"
        done
    fi
    return 127
}

# Detect the AUR wrapper
if pacman -Qi yay &>/dev/null ; then
   aurhelper="yay"
elif pacman -Qi paru &>/dev/null ; then
   aurhelper="paru"
fi

function in {
    local pkg="$1"
    if pacman -Si "$pkg" &>/dev/null ; then
        sudo pacman -S "$pkg"
    else 
        "$aurhelper" -S "$pkg"
    fi
}

# Helpful aliases
alias  l='eza -lh  --icons=auto' # long list
alias ls='eza -1   --icons=auto' # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs
alias un='$aurhelper -Rns' # uninstall package
alias up='$aurhelper -Syu' # update system/package/aur
alias pl='$aurhelper -Qs' # list installed package
alias pa='$aurhelper -Ss' # list availabe package
alias pc='$aurhelper -Sc' # remove unused cache
alias po='$aurhelper -Qtdq | $aurhelper -Rns -' # remove unused packages, also try > $aurhelper -Qqd | $aurhelper -Rsu --print -
alias vc='code --disable-gpu' # gui code editor
alias pac='sudo pacman'
alias neo='neofetch'
alias n='nvim'
alias zis='nvim ~/.zshrc && source ~/.zshrc' 
alias bis='nvim ~/.bashrc && source ~/.bashrc'
alias add='git add .'
alias commit='git commit -m'
alias push='git push -u origin'
alias branch='git branch'
alias update='sudo pacman -Syu'
alias t='tmux'
alias ta='tmux attach -t'
alias tn='tmux new -s $(basename "$PWD")'
alias so='source'
alias tiz='nvim ~/.tmux.conf && tmux source-file ~/.tmux.conf'
alias lock='i3lock'
alias shut='shutdown now'
alias battery='upower -i /org/freedesktop/UPower/devices/battery_BAT0'
alias desk='cd ~/Desktop'
alias down='cd ~/Downloads'
alias docs='cd ~/Documents'
alias work='cd ~/Desktop/work'
alias conf='~/.config'
alias lo='i3-msg exit'
alias c='clear'
alias dev='npm run dev'
alias start='npm run start'
alias cls='clear'
alias vagabond='mpv ~/Documents/yt/NA/'
alias doc='evince'
alias e='nautilus .'
alias config='git --git-dir=$HOME/Dotfiles --work-tree=$HOME'
#-------------------------------------------------------------------------------------------#
#yt-dlp aliases
alias ytu='yt-dlp -U'

# Function for YouTube Video Playlist with Best Audio and Resolution
yt-video-playlist() {
  yt-dlp -o "~/Documents/yt/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s" "$1" -f "bv*[height=$2]+ba"
}
alias yp='yt-video-playlist'

# Function for YouTube Audio Playlist in OPUS Format
yt-audio-playlist() {
  yt-dlp -o "~/Documents/yt/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s" "$1" -f 'ba' -x --audio-format opus
}
alias ypa='yt-audio-playlist'

# Function for Single YouTube Video
yt-single-video() {
  yt-dlp -o "~/Documents/yt/%(title)s.%(ext)s" "$1" -f "bv*[height=$2]+ba"
}
alias yt='yt-single-video'

# Function for Single YouTube Audio
yt-single-audio() {
  yt-dlp -o "~/Documents/yt/%(title)s.%(ext)s" "$1" -f 'ba' -x --audio-format opus
}
alias yta='yt-single-audio'
#-------------------------------------------------------------------------------------------#

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#export PATH="/usr/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
eval "$(zoxide init --cmd cd zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# feh wallpaper
#feh --bg-scale Pictures/Camera/ek.png

#tmuxfier
export PATH="$HOME/.tmuxifier/bin:$PATH"
eval "$(tmuxifier init -)"


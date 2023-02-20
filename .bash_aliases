#alias vim='vim --servername vim'
alias v='$EDITOR'
alias vim='$EDITOR'
alias vimm='vim'
alias vimrc='$EDITOR ~/.config/nvim/init.vim'
alias bashrc='$EDITOR ~/.bashrc'
alias starwars='telnet towel.blinkenlights.nl'
alias :q='exit'
alias rip='rm -rf'
alias p='sudo pacman'
alias se='sudoedit'
alias bctl='bluetoothctl'
alias ..='cd ..' 
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias mv='mv -i'
alias cp='cp -i'
alias sys='sudo systemctl'

# Radio
alias talksport='mpv https://radio.talksport.com/stream'
alias nrkp3='mpv http://streema.com/radios/play/NRK_Event'
alias nrj='mpv http://streema.com/radios/play/NRJ_Norway'
alias nrknews='mpv http://streema.com/radios/play/NRK_Alltid_Nyheter'
alias nrksport='mpv http://streema.com/radios/play/NRK_Sport'

# Git
alias d='/usr/bin/git --git-dir=$HOME/.git-dotfiles/ --work-tree=$HOME'
alias g='git'
alias gs='git status'
alias gd='git diff'
alias gds='git diff --staged'
alias gp='git push'
alias gpl='git pull'
alias gl='git log'
alias gc='git commit'
alias gcm='git commit -m'
alias gca='git commit --amend --no-edit'
alias gcam='git commit --amend'
alias ga='git add'
alias gaa='git add --all'
alias gst='git stash'
alias gstp='git stash pop'
alias gch='git checkout'
alias gaap='git add --all && git commit --amend --no-edit && git push -f'

# Auto complete git checkout alias
source /usr/share/bash-completion/completions/git
__git_complete gch _git_checkout

# Maven
alias mci='mvn clean install'

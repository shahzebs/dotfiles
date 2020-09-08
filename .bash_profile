#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export EDITOR="nvim"
export BROWSER="brave"
export PDFVIEWER="zathura"
export TERMINAL="st"
export _JAVA_AWT_WM_NONREPARENTING=1
export SUDO_ASKPASS="/usr/lib/ssh/ssh-askpass"


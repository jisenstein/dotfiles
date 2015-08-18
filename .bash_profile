# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH==~/bin:/usr/local/bin:/usr/local/mysql/bin:$PATH
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH
alias zoo="ssh -Y jdi7@node.zoo.cs.yale.edu"
alias monkey="ssh -Y jdi7@monkey.zoo.cs.yale.edu"
alias dolphin="ssh -Y jdi7@dolphin.zoo.cs.yale.edu"
alias lion="ssh -Y jdi7@lion.zoo.cs.yale.edu"
alias jaw="ssh jdi7@elsinore.cis.yale.edu"
alias v="mvim"
alias c='clear'
alias m='make'
alias n='./nov'
alias vs='vim -S .vimsession'
alias r='rm *~'
alias j=' g++ -std=c++0x'
alias 8t='cd /Users/jisenstein/8tracks.com'
alias ls="ls -G"
export PATH=/Library/Frameworks/Python.framework/Versions/2.7/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/git/bin:/usr/local/mysql/bin
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced


# 8tracks #
alias be='bundle exec'
# 8tracks #

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

export PATH="/usr/local/bin:$PATH"

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# OPAM configuration
. /Users/jisenstein/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/' 
}

export PS1="\W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

export EDITOR=vim

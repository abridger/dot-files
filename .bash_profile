alias git=hub

parse_git_dirty() {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo " ✗" || echo " ✓"
}

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ \(\1$(parse_git_dirty))/"
}

export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

export PATH="/usr/local/bin:${PATH}"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

ssh-add -A 2>/dev/null;

alias gbPurge='git fetch --all -p; git branch -vv | grep ": gone]" | awk '\''{ print $1 }'\'' | xargs -n 1 git branch -D'
alias gbpurge='git fetch --all -p; git branch -vv | grep ": gone]" | awk '\''{ print $1 }'\'' | xargs -n 1 git branch -d'

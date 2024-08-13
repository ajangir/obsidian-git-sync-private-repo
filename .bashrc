GIT_DIR=~/obs-root
GIT_WORK_TREE=~/storage/shared/obs-root
cd $GIT_WORK_TREE
alias gi='git --git-dir=$GIT_DIR'
alias gs='gi status'
alias pull='gi pull --rebase --autostash'
alias add='gi add -A;gi commit -m "vault backup mobile: $(date "+%F %R")"'
alias push='gi push'
alias b='pull;add;push'
alias e='exit'
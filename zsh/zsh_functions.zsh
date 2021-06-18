co() {
    local branches branch
    branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
    branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
    git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

cn() {
    git checkout master
    git checkout -b "$1"
}

rm-merged() {
    git checkout master
    git branch --merged master | grep -v '^[ *]*master$' | xargs git branch -d
}

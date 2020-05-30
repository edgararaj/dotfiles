alias ..="cd .."
alias mv="mv -i"
alias rm="rm -i"
alias gs="git status"
alias gca="git add . && git commit"
alias gi="git init"
alias rr="source ~/.bashrc"

export VISUAL=nvim

ccd()
{
	mkdir "$1"
	cd "$1"
}

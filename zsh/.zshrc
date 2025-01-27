######## ALIASES ########
alias v="nvim"
alias f="fzf"
alias ff="fastfetch"

alias c="clear"
alias e="exit"

alias ni="npm i"
alias ns="npm start"
alias nb="npm run build"
alias nl="npm link ~/Documents/projects/dxc/helix/uptime-storybook"

alias gst="git status"
alias gf="git fetch"
alias gl="git pull"
alias gp="git push"
alias gpf!="git push -f"
alias gaa="git add ."
alias gcm="git commit"
alias gcd="git checkout develop"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gbd="git branch -d"
alias gbD="git branch -D"
alias gbc="git branch --show-current"
alias gcp="git cherry-pick"

#########################

export EDITOR=nvim

# starship
eval "$(starship init zsh)"

# zoxide
eval "$(zoxide init zsh)"

# zsh-syntax-highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh-autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# fnm
eval "$(fnm env --use-on-cd)"

# bun completions
[ -s "/Users/sangnguyen/.bun/_bun" ] && source "/Users/sangnguyen/.bun/_bun"

# pyenv
export PATH="$HOME/.local/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# eza
alias ls="eza --color=always --icons=always --oneline"
alias lsa="ls -la"

# bat
export BAT_THEME="Catppuccin Mocha"

# fzf
eval "$(fzf --zsh)"

export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

# yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

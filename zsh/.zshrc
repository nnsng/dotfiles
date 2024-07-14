######## ALIASES ########
alias nv="nvim"

alias c="clear"
alias e="exit"

alias ni="npm i"
alias ns="npm start"
alias nb="npm run build"

alias gst="git status"
alias gf="git fetch"
alias gl="git pull"
alias gp="git push"
alias gpf!="git push -f"
alias gaa="git add ."
alias gc="git commit"
alias gcm="git commit -m"
alias gcd="git checkout develop"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gbd="git branch -d"
alias gbD="git branch -D"
alias gbc="git branch --show-current"

#########################

export EDITOR=nvim

# starship
eval "$(starship init zsh)"

# zoxide
eval "$(zoxide init zsh)"

# zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh-autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# nvm
[ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
source /usr/share/nvm/nvm.sh
source /usr/share/nvm/bash_completion
source /usr/share/nvm/install-nvm-exec

# pyenv
export PATH="$HOME/.local/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# eza
alias ls="eza --color=always --icons=always --oneline"
alias lsa="ls -la"

# bat
export BAT_THEME="Catppuccin Macchiato"

# fzf
eval "$(fzf --zsh)"

export FZF_DEFAULT_OPTS=" \
--color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
--color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796"

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


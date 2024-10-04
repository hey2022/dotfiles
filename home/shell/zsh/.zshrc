# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Download Znap, if it's not there yet.
znap_repo_dir="$HOME/.znap"
[[ -r $znap_repo_dir/znap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git $znap_repo_dir/znap
source $znap_repo_dir/znap/znap.zsh # Start Znap

znap source romkatv/powerlevel10k
znap source zsh-users/zsh-syntax-highlighting
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-completions
znap source zsh-users/zsh-history-substring-search

znap source marlonrichert/zsh-autocomplete
bindkey              "^I"         menu-complete
bindkey "$terminfo[kcbt]" reverse-menu-complete
bindkey -M menuselect '^M' .accept-line

# History
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=$ZDOTDIR/history

# evals
znap eval zoxide "zoxide init zsh"
znap eval thefuck "thefuck --alias --enable-experimental-instant-mode"
znap eval mcfly "mcfly init zsh"

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

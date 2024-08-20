#starship
eval "$(starship init zsh)"

#Obsidianを自動で開くようにするスクリプト
open_obsidian_and_edit() {
  # Obsidianを開く
  open -a "Obsidian"
  
  # 少し待つ（オプション）
  sleep 2
  
  # 指定のディレクトリに移動
  cd ~/Documents/Obsidian\ Vault
  
  # neovimを実行
  nvim -c VFiler

  #AppScriptを使ってWezTermをアクティブに戻す
}

#fzf+fd
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'

 eval "$(fzf --zsh)"


#alias
alias obsi='open_obsidian_and_edit'
alias ls='lsd -A --group-dirs=first'
alias ll='lsd -lA --group-dirs=first'
alias vi='nvim'
alias oo='open ./'
# カレントディレクトリ以下をプレビューし選択して開く
alias lk='_look'
_look() {
	if [ "$1" = "-a" ]; then
		local find_result=$(find . -type f -o -type l)
	else
		local find_result=$(find . -maxdepth 1 -type f -o -type l)
	fi
		local target_files=($(echo "$find_result" \
		| sed 's/\.\///g' \
		| grep -v -e '.jpg' -e '.gif' -e '.png' -e '.jpeg' \
		| sort -r \
		| fzf-tmux -p80% --select-1 --prompt 'vim ' --preview 'bat --color always {}' --preview-window=right:70%
))
[ "$target_files" = "" ] && return
vim -p ${target_files[@]}
}

#nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH
######################################################################
# history

# 履歴保存数の設定
HISTSIZE=10000
SAVEHIST=10000

# 履歴に時間も記録
setopt extended_history
# 履歴の同じ古いコマンドは削除
setopt hist_ignore_all_dups
# history (fc -l)コマンドを履歴に保存しない
setopt hist_no_store
# 履歴に余計な空白を記録しない
setopt hist_reduce_blanks
# 他ウィンドウと履歴を共有する
setopt share_history

# 最後のワードをスマートにする
# ls /usr/share
# ls !$&  or  ls ESC-.&
# ls !$  or ls ESC-. <-- insert-last-wordだと「&」が選ばれるが、smart-insert-last-wordでは「/usr/share」が選ばれる
autoload -Uz smart-insert-last-word
zle -N insert-last-word smart-insert-last-word

# 履歴のあいまい検索
select-history() {
    LBUFFER=$(history -Dinr 1 | fzf --no-sort +m --query "$LBUFFER" --prompt="History > " | choose 3:);
	}
	zle -N select-history
	# 履歴をあいまい検索から実行
	accept-history() {
	    zle select-history
		    zle accept-line
			}
			zle -N accept-history

bindkey '^r' accept-history
bindkey '®' select-history # TODO: menuselectの"^j"と"^m"みたいに確定キーで切り替えたい 

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

### plugin ###
# syntax-highlight
zinit light zsh-users/zsh-syntax-highlighting
# Auto Suggest
zinit light zsh-users/zsh-autosuggestions
# Tabで候補
# zinit light zsh-users/zsh-completions

##############

fpath=(/usr/local/share/zsh-completions ${fpath})


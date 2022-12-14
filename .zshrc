#starship
eval "$(starship init zsh)"

#fzf+fd
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'

#alias
alias ls='lsd -A --group-dirs=first'
alias ll='lsd -lA --group-dirs=first'
alias vi='nvim'

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

#####################################################################
# completion
# 補完を有効
autoload -Uz compinit && compinit

# 候補が大量時にもメニュー表示の確認せず表示させる
LISTMAX=-1

# カーソル位置での単語補完を有効
setopt complete_in_word
# リスト表示をコンパクトにする
setopt list_packed
# リスト選択を縦でなく横移動
setopt list_rows_first
# 自動でのmenu表示をしない
setopt no_auto_menu
# 自動でのmenu補完をしない
setopt no_menu_complete

# 補完メニューの色設定
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# 小文字入力でも大文字に補完一致させる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# 項目毎に補完メニューをグループ化
zstyle ':completion:*' group-name ''
# 補完メニューのグループ名を色設定
zstyle ':completion:*:descriptions' format '%F{yellow}# %d:%f'
# 補完メニューのグループ表示順を設定
zstyle ':completion:*' group-order local-directories named-directories path-directories
# 空白時にもタブキーで補完させる
zstyle ':completion:*' insert-tab false

# 補完メニューの明示的表示
menu-complete-and-select() {
    zle menu-complete
	    zle menu-select
		}
		zle -N menu-complete-and-select

# Tabはメニュー補完、option-iはbashっぽい補完（連番ファイル選択時に便利）
#bindkey '^i' menu-complete-and-select # Tab
#bindkey 'ˆ' expand-or-complete # option-i
######################################################################

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
zinit light zsh-users/zsh-completions

##############

fpath=(/usr/local/share/zsh-completions ${fpath})

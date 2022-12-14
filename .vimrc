"タイトル表示
set title

"シンタックスハイライト有効化
syntax on
highlight Normal ctermbg=black ctermfg=grey
highlight StatusLine term=none cterm=none ctermfg=black ctermbg=grey
highlight CursorLine term=none cterm=none ctermfg=none ctermbg=darkgray

"行番号表示
set number

"ルーラー表示
set ruler

"オートインデント
set autoindent
set tabstop=4
set shiftwidth=4

"ステータスバー常に表示
set laststatus=2
set statusline=%F%r%h%=

"インクリメンタルサーチ有効化
set incsearch


"閉じ括弧入力時、対応する括弧強調
set showmatch

"カーソル関係
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

"括弧入力時真ん中へカーソル移動
function! MyInsertBracket(lbrackets, rbracket)
    if index(a:lbrackets, getline('.')[col('.') - 2]) != -1
	        return a:rbracket . "\<Left>"
	else
			return a:rbracket
	endif
endfunction
inoremap <expr> ) MyInsertBracket(['('], ')')
inoremap <expr> } MyInsertBracket(['{'], '}')
inoremap <expr> ] MyInsertBracket(['['], ']')
inoremap <expr> > MyInsertBracket(['<'], '>')
inoremap <expr> " MyInsertBracket(['"'], '"')
inoremap <expr> ' MyInsertBracket(['''', '`'], '''')

"clang-format用
map <C-K> :pyf /usr/local/share/clang/clang-format.py<cr>
imap <C-K> <c-o>:pyf /usr/local/share/clang/clang-format.py<cr>

"IMEから抜けるあれ
set imdisable

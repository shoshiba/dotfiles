"見た目系
"タイトル表示
set title
"行番号表示
set number
"ルーラー表示
set ruler
"現在の行を強調表示
set cursorline
"不可視文字を可視化
set list listchars=tab:\▸\-
"Tab文字を半角スペースに
set expandtab
"ステータスバー常に表示
set laststatus=2
set statusline=%F%r%h%=
"カーソルの表示設定
if has('vim_starting')
  " 挿入モード時に非点滅の縦棒タイプのカーソル
  let &t_SI .= "\e[6 q"
  " ノーマルモード時に非点滅のブロックタイプのカーソル
  let &t_EI .= "\e[2 q"
  " 置換モード時に非点滅の下線タイプのカーソル
  let &t_SR .= "\e[4 q"
endif

"検索系
"検索文字列が小文字の場合は大文字小文字を区別せず検索
set ignorecase
"インクリメンタルサーチ有効化
set incsearch
"ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>



"以下未整理
"シンタックスハイライト有効化
syntax on
highlight Normal ctermbg=black ctermfg=grey
highlight StatusLine term=none cterm=none ctermfg=black ctermbg=grey
highlight CursorLine term=none cterm=none ctermfg=none ctermbg=darkgray


"オートインデント
set autoindent
set tabstop=2
set shiftwidth=2




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

"IMEから抜けるあれ
set imdisable

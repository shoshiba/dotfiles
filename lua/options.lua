local options = {
-- UTF-8が正義     
encoding = "utf-8",
fileencoding = "utf-8",

-- 見た目系
title = true, -- タイトルを表示
number = true, -- 行番号を表示
ruler = true, -- ルーラーを表示
cursorline = true,-- 現在の行を強調表示
list = true, -- 不可視文字を表示
listchars = { tab = '▸-' }, -- タブ文字の表示形式を設定
expandtab = true, -- タブをスペースに展開
laststatus = 2, -- ステータスバーを常に表示
statusline = '%F%r%h%=', -- ステータスラインの形式を設定
ignorecase = true, -- 検索時に大文字小文字を区別しない
incsearch = true, -- インクリメンタルサーチを有効にする
smartindent = true, -- スマートインデントを有効にする
tabstop = 2, -- タブ文字の幅を2に設定
shiftwidth = 2, -- シフト操作でのインデント幅を2に設定
showmatch = true, -- 対応する括弧を強調表示
termguicolors = true, -- ターミナルのGUIカラーを有効にする
background = 'dark', -- 背景色を'dark'に設定
statusline = "%F%r%h%=", --statuslineの表示設定
showmode = false, -- Insertなどを表示しない(AirLineがあるので

-- 検索系
-- 検索文字列が小文字の場合は大文字小文字を区別せず検索
ignorecase = true,
-- インクリメンタルサーチ有効化
incsearch = true,
-- 閉じカッコ入力時、対応するカッコ強調
showmatch = true
}


for k, v in pairs(options) do
  vim.opt[k] = v
end

--
require("options")
require("keymaps")
require("lazy_nvim")
--require("plugins")
require("colorscheme")



-- プラグイン管理
--vim.cmd [[
--call plug#begin('~/.vim/plugged')
--Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
--Plug 'junegunn/fzf.vim'
--Plug 'unblevable/quick-scope'
--Plug 'vim-airline/vim-airline'
--Plug 'vim-airline/vim-airline-themes'
--Plug 'prabirshrestha/vim-lsp'
--Plug 'mattn/vim-lsp-settings'
--Plug 'neoclide/coc.nvim', {'branch': 'release'}
--Plug 'nvim-telescope/telescope.nvim'
--"ファイラー周り
--Plug 'obaland/vfiler.vim'
--Plug 'obaland/vfiler-column-devicons'
--"Markdownを豪華に
--Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
--call plug#end()
--]]
--
---- Treesitter設定
--require'nvim-treesitter.configs'.setup {
--  highlight = {
--    enable = true,
--    disable = {
--      'lua',
--      'ruby',
--      'toml',
--      'c_sharp',
--      'vue',
--    }
--  }
--}
--
-- Obsidian-bridge設定
-- require('obsidian-bridge').setup({
--     obsidian_server_address = "http://localhost:27123",
-- })
--
---- Airline設定
vim.g.airline_theme = 'dark'
vim.g.airline_extensions_tabline_enabled = 1 
vim.g.airline_powerline_fonts = 1 
--

-- IMEから抜ける設定
vim.cmd([[
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"
]])

-- カーソルの表示設定
if vim.fn.has('vim_starting') == 1 then
  vim.cmd([[
    let &t_SI .= "\e[6 q"
    let &t_EI .= "\e[2 q"
    let &t_SR .= "\e[4 q"
  ]])
end

-- カーソルキーでの行末・行頭移動を許可
vim.cmd("set whichwrap+=<,>,[,],h,l")
-- キーワードに '-' を追加
vim.cmd("set iskeyword+=-")

-- FZF用設定
vim.cmd("set rtp+=/opt/homebrew/opt/fzf")

-- シンタックスハイライト有効化
-- vim.cmd('syntax on')
-- vim.cmd('highlight Normal ctermbg=black ctermfg=grey')
-- vim.cmd('highlight StatusLine term=none cterm=none ctermfg=black ctermbg=grey')
-- vim.cmd('highlight CursorLine term=none cterm=none ctermfg=none ctermbg=darkgray')

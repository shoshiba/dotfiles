--
require("options")
require("keymaps")
require("colorscheme")


-- lazy.nvim用
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
  performance = {
    rtp = {
      disabled_plugins = {
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
      },
    },
  },
})

-- vfiler configuration (Explorer style)
require'vfiler/config'.setup {
  options = {
    columns = 'indent,devicons,name',
    auto_cd = true,
    auto_resize = true,
    keep = true,
    layout = 'left',
    width = 30,
  },
}

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


return {
  -- quick scope
  'unblevable/quick-scope',
  
  -- telescope
  'nvim-telescope/telescope.nvim',
  -- airline,
  'vim-airline/vim-airline',
  'vim-airline/vim-airline-themes',

  -- iceberg
  'cocopon/iceberg.vim',
  -- obsidian-bridge
  {
    "oflisback/obsidian-bridge.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function() require("obsidian-bridge").setup() end,
    event = {
      "BufReadPre *.md",
      "BufNewFile *.md",
    },
    lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
    }
  },
  --Treesitter
  'nvim-treesitter/nvim-treesitter',

  -- vFiler
  {
    'obaland/vfiler.vim',
  },
  'obaland/vfiler-column-devicons',
  'obaland/vfiler-fzf',
}

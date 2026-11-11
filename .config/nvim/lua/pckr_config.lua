local function bootstrap_pckr()
  local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

  if not (vim.uv or vim.loop).fs_stat(pckr_path) then
    vim.fn.system({
      'git',
      'clone',
      "--filter=blob:none",
      'https://github.com/lewis6991/pckr.nvim',
      pckr_path
    })
  end

  vim.opt.rtp:prepend(pckr_path)
end

bootstrap_pckr()

require('pckr').add{
    'tibabit/vim-templates';
    'tpope/vim-commentary';
    'tpope/vim-fugitive';
    'vimwiki/vimwiki';
    'chentoast/marks.nvim';
    -- TODO force double quotes
    {
      'kristijanhusak/vim-dadbod-ui',
      requires = {
        'tpope/vim-dadbod';
      }
    },
    {
      "harrisoncramer/gitlab.nvim",
      requires = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
        -- Recommended but not required. Better UI for pickers.
        "stevearc/dressing.nvim",
        -- Recommended but not required. Icons in discussion tree.
        "nvim-tree/nvim-web-devicons",
      },
      -- Builds the Go binary
      run = function() require("gitlab.server").build() end,
      config = function()
        -- We require some global state from diffview
        require("diffview")
        require("gitlab").setup()
      end
    },
    {
      "denialofsandwich/sudo.nvim",
      requires = {
        "MunifTanjim/nui.nvim",
      },
      config = function()
        require("sudo").setup({commands = true})
      end
    }

    -- lsp
    'prabirshrestha/vim-lsp';
    'hrsh7th/vim-vsnip-integ';
    'hrsh7th/vim-vsnip';

    -- Syntax
    'nvim-treesitter/nvim-treesitter';
    'aklt/plantuml-syntax';
    's3rvac/vim-syntax-redminewiki.git';
    'powerman/vim-plugin-AnsiEsc';
    'edkolev/erlang-motions';
    'gleam-lang/gleam.vim';
    'elixir-editors/vim-elixir';
    {
      'andyl/vim-textobj-elixir',
      requires = {
        'kana/vim-textobj-user';
      }
    },

    -- Colorschemes
    'catppuccin/nvim';
    'safv12/andromeda.vim';
    'letorbi/vim-colors-modern-borland';
    'regularhunter/builder-dark.vim';
    'projekt0n/caret.nvim';
    'sainnhe/everforest';
    'necrogoru/shades-of-purple.nvim';
    'mitander/flume.nvim';
    'rezniqov/soviet.nvim';
    'w0ng/vim-hybrid'
}

-- Активация pckr (lazy тоже) отключает loadplugins, из-за чего не работают
-- vim-плагины
vim.cmd("set loadplugins")
vim.cmd("set runtimepath^=~/.vim runtimepath+=~/.vim/after")
vim.cmd("let &packpath=&runtimepath")
vim.cmd("source ~/.vimrc")


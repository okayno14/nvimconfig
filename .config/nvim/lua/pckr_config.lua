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
    'nvim-treesitter/nvim-treesitter';
    'catppuccin/nvim';
    'safv12/andromeda.vim';
    'andyl/vim-textobj-elixir';
    'powerman/vim-plugin-AnsiEsc';
    'edkolev/erlang-motions';
    'gleam-lang/gleam.vim';
    'hrsh7th/vim-vsnip-integ';
    'kana/vim-textobj-user';
    'kristijanhusak/vim-dadbod-ui';
    'letorbi/vim-colors-modern-borland';
    'aklt/plantuml-syntax';
    's3rvac/vim-syntax-redminewiki.git';
    'regularhunter/builder-dark.vim';
    'tibabit/vim-templates';
    'tpope/vim-commentary';
    'tpope/vim-dadbod';
    'tpope/vim-fugitive';
    'elixir-editors/vim-elixir';
    'prabirshrestha/vim-lsp';
    'vimwiki/vimwiki';
    'w0ng/vim-hybrid';
    'sainnhe/everforest';
    'projekt0n/caret.nvim';
    'necrogoru/shades-of-purple.nvim';
    'chentoast/marks.nvim';
    'mitander/flume.nvim';
    'rezniqov/soviet.nvim';
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
      run = function() require("gitlab.server").build() end, -- Builds the Go binary
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
}

-- Активация pckr (lazy тоже) отключает loadplugins, из-за чего не работают
-- vim-плагины
vim.cmd("set loadplugins")
vim.cmd("set runtimepath^=~/.vim runtimepath+=~/.vim/after")
vim.cmd("let &packpath=&runtimepath")
vim.cmd("source ~/.vimrc")


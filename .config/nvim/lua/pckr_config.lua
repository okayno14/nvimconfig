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


-- TODO Вот этот урод запрещает загрузить vim-плагины: тупо после него ничего не работает
require('pckr').add{
    {
      "harrisoncramer/gitlab.nvim",
      requires = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
        "stevearc/dressing.nvim", -- Recommended but not required. Better UI for pickers.
        "nvim-tree/nvim-web-devicons", -- Recommended but not required. Icons in discussion tree.
      },
      run = function() require("gitlab.server").build() end, -- Builds the Go binary
      config = function()
        require("diffview") -- We require some global state from diffview
        require("gitlab").setup()
      end
    }
}

-- Активация pckr (lazy тоже) отключает loadplugins, из-за чего не работают
-- vim-плагины
vim.cmd("set loadplugins")
vim.cmd("set runtimepath^=~/.vim runtimepath+=~/.vim/after")
vim.cmd("let &packpath=&runtimepath")
vim.cmd("source ~/.vimrc")


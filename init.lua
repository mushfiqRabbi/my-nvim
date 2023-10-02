vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.o.clipboard = 'unnamedplus'



-- vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
-- vim.keymap.set('n', '<S-l>', ':lua require("vscode-neovim").call("workbench.action.nextEditor")<CR>',
--   { noremap = true, silent = true })
-- vim.keymap.set('n', '<S-h>', ':lua require("vscode-neovim").call("workbench.action.previousEditor")<CR>',
--   { noremap = true })

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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


require("lazy").setup(
  {
    "phaazon/hop.nvim",
    config = function()
      require('hop').setup()
      local hop = require('hop')
      vim.keymap.set('n', 's', function()
        hop.hint_char1()
      end, { remap = true })
    end
  }
)

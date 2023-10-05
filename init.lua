vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.o.clipboard = 'unnamedplus'
vim.o.ignorecase = true
vim.o.smartcase = true

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
-- vim.keymap.set({ 'n', 'x' }, '<C-h>', ':lua require("vscode-neovim").call("workbench.action.previousEditorInGroup")<CR>',
--   { noremap = true })
-- vim.keymap.set({ 'n', 'x' }, '<C-l>', ':lua require("vscode-neovim").call("workbench.action.nextEditorInGroup")<CR>',
--   { noremap = true })
vim.keymap.set('n', '<C-q>', '<C-v>', { noremap = true })
vim.keymap.set('n', '<C-p>',
  '<Cmd>call VSCodeNotify("workbench.action.togglePanel")<CR><Cmd>call VSCodeNotify("workbench.action.focusActiveEditorGroup")<CR>',
  { noremap = true })
-- vim.keymap.set('n', '<C-k>',
--   ':lua require("vscode-neovim").call("workbench.action.toggleSidebarVisibility")<CR>',
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
    "ggandor/leap.nvim",
    dependencies = { "tpope/vim-repeat" },
    config = function()
      require('leap').add_default_mappings()
    end
  }
)

require("nvchad.mappings")
require("configs.mappings.harpoon")
require("configs.mappings.tmuxNavigator")
require("configs.mappings.refactoring")

local map = vim.keymap.set

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("v", ";", ":", { nowait = true })

local map = vim.keymap.set

map("n", "<leader>a", function()
	require("harpoon"):list():append()
end, { noremap = true, silent = true, desc = "Add current file to harpoon list" })

map("n", "<C-e>", function()
	local harpoon = require("harpoon")
	harpoon.ui:toggle_quick_menu(harpoon:list())
end, { noremap = true, silent = true, desc = "Toggle harpoon quick menu" })

map("n", "<A-n>", function()
	require("harpoon"):list():select(1)
end, { desc = "Open harpoon first bookmark" })

map("n", "<A-m>", function()
	require("harpoon"):list():select(2)
end, { desc = "Open harpoon second bookmark" })

map("n", "<A-j>", function()
	require("harpoon"):list():select(3)
end, { desc = "Open harpoon third bookmark" })

map("n", "<A-k>", function()
	require("harpoon"):list():select(4)
end, { desc = "Open harpoon fourth bookmark" })

local map = vim.keymap.set

map({ "n", "x" }, "<leader>re", function()
	require("refactoring").refactor("Extract Function")
end, { desc = "Extract Function" })

map({ "n", "x" }, "<leader>rf", function()
	require("refactoring").refactor("Extract Function To File")
end, { desc = "Extract Function To File" })

map({ "n", "x" }, "<leader>rv", function()
	require("refactoring").refactor("Extract Variable")
end, { desc = "Extract Variable" })

map({ "n", "x" }, "<leader>ri", function()
	require("refactoring").refactor("Inline Variable")
end, { desc = "Inline Variable" })

map("n", "<leader>rI", function()
	require("refactoring").refactor("Inline Function")
end, { desc = "Inline Function" })

map("n", "<leader>rb", function()
	require("refactoring").refactor("Extract Block")
end, { desc = "Extract Block" })

map("n", "<leader>rbf", function()
	require("refactoring").refactor("Extract Block To File")
end, { desc = "Extract Block To File" })

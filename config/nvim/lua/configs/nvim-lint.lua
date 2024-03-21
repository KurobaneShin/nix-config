local lint = require "lint"

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

lint.linters_by_ft = {
  typescript = { "eslint", "biomejs" },
  javascript = { "eslint", "biomejs" },
  typescriptreact = { "eslint", "biomejs" },
  javascriptreact = { "eslint", "biomejs" },
  go = { "golangcilint" },
}

local eslint = lint.linters.eslint_d
-- local biome = lint.linters.biome

eslint.args = {
  "--no-warn-ignored", -- <-- this is the key argument
  "--format",
  "json",
  "--stdin",
  "--stdin-filename",
  function()
    return vim.api.nvim_buf_get_name(0)
  end,
}

vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
  group = lint_augroup,
  callback = function()
    lint.try_lint(nil, {
      ignore_errors = true,
    })
  end,
})

local null_ls = require "null-ls"

local b = null_ls.builtins
local augroup = vim.api.nvim_create_augroup("Ls[Formatting", {})
local sources = {

  -- webdev stuff
  b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css", "typescript", "typescriptreact" } }, -- so prettier works only on these filetypes
  -- Lua
  b.formatting.stylua,
  b.formatting.rome.with {
    only_local = "node_modules/.bin",
    command = "biome",
  },
  null_ls.builtins.code_actions.eslint_d.with {
    only_local = "node_modules/.bin",
  }, -- suggest fixes from eslint

  null_ls.builtins.diagnostics.eslint_d.with {
    only_local = "node_modules/.bin",
  }, --show error message on the screen
  -- cpp
  b.formatting.clang_format,
}
null_ls.setup {
  debug = true,
  sources = sources,
  -- you can reuse a shared lspconfig on_attach callback here
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
          -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
}

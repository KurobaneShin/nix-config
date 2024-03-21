local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local util = require "lspconfig.util"
local configs = require "lspconfig/configs"
-- if you just want default config for the servers then put them in a table
local servers = {
  "html",
  "cssls",
  "tsserver",
  "clangd",
  "eslint",
  "tailwindcss",
  "docker_compose_language_service",
}

lspconfig.tsserver.setup {
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
    client.server_capabilities.documentFormattingProvider = false
  end,
}

--test htmx lsp
lspconfig.gopls.setup {
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
    },
  },
}

if not configs.golangcilsp then
  configs.golangcilsp = {
    default_config = {
      cmd = { "golangci-lint-langserver" },
      root_dir = lspconfig.util.root_pattern(".git", "go.mod"),
      init_options = {
        command = {
          "golangci-lint",
          "run",
          "--enable-all",
          "--disable",
          "lll",
          "--out-format",
          "json",
          "--issues-exit-code=1",
        },
      },
    },
  }
end
lspconfig.golangci_lint_ls.setup {
  filetypes = { "go", "gomod" },
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

--
-- lspconfig.pyright.setup { blabla}

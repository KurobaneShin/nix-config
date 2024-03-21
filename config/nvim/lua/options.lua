require "nvchad.options"

local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "go",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "tailwindcss-language-server",
    "prettier",
    "deno",
    -- "biome",
    -- "eslint_d",
    -- c/cpp stuff
    "clangd",
    "clang-format",

    --golang
    "gopls",
    "gofumpt",
    "goimports-reviser",
    "golangci-lint",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.gitConflict = {
  default_mappings = true, -- disable buffer local mapping created by this plugin
  default_commands = true, -- disable commands created by this plugin
  disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
  list_opener = "copen", -- command or function to open the conflicts list
  highlights = { -- They must have background color, otherwise the default color will be used
    incoming = "DiffAdd",
    current = "DiffText",
  },
}

return M

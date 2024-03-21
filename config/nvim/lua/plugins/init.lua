local options = require "options"

return {
  {
    "stevearc/conform.nvim",
    event = {
      "BufReadPre",
      "BufNewFile",
    },
    cmd = { "ConformInfo" },
    keys = {
      {
        -- Customize or remove this keymap to your liking
        "<leader>fm",
        function()
          require("conform").format { async = true, lsp_fallback = true }
        end,
        mode = "",
        desc = "Format buffer",
      },
    },
    config = function()
      require "configs.conform"
    end,
  },

  {
    "mfussenegger/nvim-lint",
    event = {
      "BufReadPre",
      "BufNewFile",
    },
    config = function()
      require "configs.nvim-lint"
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = { enable = true },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = options.treesitter,
    dependencies = {
      "windwp/nvim-ts-autotag",
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = options.nvimtree,
  },

  -- {
  --   "williamboman/mason.nvim",
  --   opts = options.mason,
  -- },

  --  {
  -- 	"mfussenegger/nvim-dap",
  -- },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "nvchad.configs.lspconfig"
      require "configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require "configs.copilot"
    end,
  },

  {
    "akinsho/git-conflict.nvim",
    version = "*",
    event = "BufReadPre",
    opts = function()
      return
    end,
    config = function(_, opts)
      require("git-conflict").setup(opts)
    end,
  },

  {
    "olexsmir/gopher.nvim",
    config = function()
      require "nvim-lua/plenary.nvim"
      require "nvim-treesitter/nvim-treesitter"

      require("gopher").setup {
        commands = {
          go = "go",
          gomodifytags = "gomodifytags",
          gotests = "~/go/bin/gotests", -- also you can set custom command path
          impl = "impl",
          iferr = "iferr",
        },
      }
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {}
    end,
  },
  {
    "ThePrimeagen/refactoring.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("refactoring").setup()
    end,
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function(_, opts)
      require("harpoon").setup(opts)
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
    event = "VeryLazy",
  },
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "declancm/cinnamon.nvim",
    event = "VeryLazy",
    config = function()
      require("cinnamon").setup()
    end,
  },
}

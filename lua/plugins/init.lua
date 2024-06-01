return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
  	"williamboman/mason.nvim",
  	opts = {
  		ensure_installed = {
  			"lua-language-server", "stylua",
  			"html-lsp", "css-lsp" , "prettier", "jedi-language-server", "mypy"
  		},
  	},
  },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
       "html", "css", "python"
  		},
  	},
  },

    {
        "mfussenegger/nvim-lint",
        event = 'BufWritePost',
        config = function ()

            require('lint').linters_by_ft = {
                python = {
                    'mypy'
                }
            }
            vim.api.nvim_create_autocmd({"BufWritePost"}, {
                pattern = {"*.py",},
                callback = function () require('lint').try_lint()
                end,
            })

        end
    },

    {
        "pocco81/auto-save.nvim"
    }
}

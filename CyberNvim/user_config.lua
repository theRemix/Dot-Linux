-- use a user/user_config.lua file to provide your own configuration

local M = {}

-- add any null-ls sources you want here
M.setup_sources = function(b)
	return {
		-- b.formatting.autopep8,
		b.code_actions.gitsigns,
    b.formatting.goimports,
    b.formatting.gofmt,
    b.formatting.gofumpt,
    b.formatting.golines.with({
      extra_args = {
        "--max-len=180",
        "--base-formatter=gofumpt",
      },
    }),
	}
end

-- add mason sources to auto-install
M.mason_ensure_installed = {
	null_ls = {
		"stylua",
		"jq",
    "goimports",
    "gofumpt",
    "golines",
    "svelte"
	},
	dap = {
		"python",
		"delve",
	},
}

-- add servers to be used for auto formatting here
M.formatting_servers = {
	-- ["rust_analyzer"] = { "rust" },
	["lua_ls"] = { "lua" },
	["svelte"] = { "svelte" },
	["null_ls"] = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
	},
}

-- options you put here will override or add on to the default options
M.options = {
	opt = {
		confirm = true, -- idk what this is
	},
}

-- Set any to false that you want disabled in here.
-- take a look at the autocommands file in lua/core for more information
-- Default value is true if left blank
M.autocommands = {
	alpha_folding = true,
	treesitter_folds = true,
	trailing_whitespace = true,
	remember_file_state = true,
	session_saved_notification = true,
	css_colorizer = true,
	cmp = true,
}

-- set to false to disable plugins
-- Default value is true if left blank
M.enable_plugins = {
	-- A code outline window for skimming and quick navigation
	aerial = true,

	alpha = true,
	autotag = true,
	bufferline = true,
	context = true,
	copilot = true,
	dressing = true,
	gitsigns = true,
	hop = true,
	img_clip = true,
	indent_blankline = true,
	lsp_zero = true,
	lualine = true,
	neodev = true,
	neoscroll = true,

  -- File explorer
	neotree = true,

	session_manager = true,
	noice = true,
	null_ls = true,
	autopairs = true,
	cmp = true,
	colorizer = true,
	dap = true,
	notify = true,
	surround = true,
	treesitter = true,
	ufo = true,
	onedark = true,
	project = true,
	rainbow = true,
	scope = true,
	telescope = true,
	toggleterm = true,
	trouble = true,
	twilight = true,
	whichkey = true,
	windline = true,
	zen = true,
}

-- add extra plugins in here
M.plugins = {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
		},
	},
	{
		"LunarVim/lunar.nvim", -- themes
	},
	{
		"nvim-lualine/lualine.nvim", -- lualine theme
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

  {
    "zbirenbaum/copilot-cmp",
    event = "InsertEnter",
    config = function () require("copilot_cmp").setup() end,
    dependencies = {
      "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      config = function()
        require("copilot").setup({
          suggestion = { enabled = false },
          panel = { enabled = false },
        })
      end,
    },
  },

  -- seamless navigation between tmux panes and vim splits
  { "alexghergh/nvim-tmux-navigation" },

  -- golang
  -- {
  --   "olexsmir/gopher.nvim",
  --   ft = "go",
  --   -- branch = "develop", -- if you want develop branch
  --                          -- keep in mind, it might break everything
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --     "mfussenegger/nvim-dap", -- (optional) only if you use `gopher.dap`
  --   },
  --   -- (optional) will update plugin's deps on every update
  --   build = function()
  --     vim.cmd.GoInstallDeps()
  --   end,
  --   ---@type gopher.Config
  --   opts = {},
  -- },
  { "leoluz/nvim-dap-go" },
  {
    "ray-x/go.nvim",
    dependencies = {  -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
      require("go").setup()
    end,
    event = {"CmdlineEnter"},
    ft = {"go", 'gomod'},
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  },
  -- python
  { "mfussenegger/nvim-dap-python" },
  -- other
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
  {
    "folke/lsp-colors.nvim",
    event = "BufRead",
  },
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp"
  },
  {
      'dgagn/diagflow.nvim',
      -- event = 'LspAttach', This is what I use personnally and it works great
      opts = {}
  },
  {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    opts = {},
  },
  { "evanleck/vim-svelte" }
}

-- add extra configuration options here, like extra autocmds etc.
-- feel free to create your own separate files and require them in here
M.user_conf = function()
  -- local insert_mode = vim.api.nvim_set_keymap

	-- vim.cmd([[
  -- autocmd VimEnter * lua vim.notify("Welcome to CyberNvim!", "info", {title = "Neovim"})]])
	-- require("user.autocmds")

	-- color theme
	vim.cmd("colorscheme lunar")
	-- lualine theme
	require("lualine").setup({
		options = {
			icons_enabled = true,
			theme = "lunar",
		},
	})

  require("dap-python").setup("python3")

  -- require("svelte-language-server").setup {
  --   filetypes = { "svelte" },
  --   on_attach = function(client, bufnr)
  --     if client.name == 'svelte' then
  --       vim.api.nvim_create_autocmd("BufWritePost", {
  --         pattern = { "*.js", "*.ts", "*.svelte" },
  --         callback = function(ctx)
  --           client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
  --         end,
  --       })
  --     end
  --     if vim.bo[bufnr].filetype == "svelte" then
  --       vim.api.nvim_create_autocmd("BufWritePost", {
  --         pattern = { "*.js", "*.ts", "*.svelte" },
  --         callback = function(ctx)
  --           client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
  --         end,
  --       })
  --     end
  --   end
  -- }

  -- Map "jk" -> ESC
  vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })


  -- cycle through buffers
  vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", {})
  vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", {})

  -- Smarter yank
  --   yanks line starting from cursor
  --   good for yanking to cli
  vim.keymap.set("v", "Y", "y$", {})

  -- setup cmp with copilot
  require("cmp").setup {
    -- other setup
    sources = {
      { name = "nvim_lsp" },
      { name = "gopls" },
      { name = "luasnip" },
      { name = "buffer" },
      { name = "path" },
      { name = "copilot" },
      { name = "svelte" },
    },
  }
  local lspconfig = require("lspconfig")
  lspconfig.gopls.setup({
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
        gofumpt = true,
      },
    },
  })
  lspconfig.svelte.setup {
    filetypes = { "svelte" },
    on_attach = function(client, bufnr)
      if client.name == 'svelte' then
        vim.api.nvim_create_autocmd("BufWritePost", {
          pattern = { "*.js", "*.ts", "*.svelte" },
          callback = function(ctx)
            client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
          end,
        })
      end
      if vim.bo[bufnr].filetype == "svelte" then
        vim.api.nvim_create_autocmd("BufWritePost", {
          pattern = { "*.js", "*.ts", "*.svelte" },
          callback = function(ctx)
            client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
          end,
        })
      end
    end
  }

  vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = 'minimal',
      border = 'rounded',
      source = 'always',
      header = '',
      prefix = '',
    },
  })

  -- require("noice").setup({
  --   lsp = {
  --     -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
  --     override = {
  --       ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
  --       ["vim.lsp.util.stylize_markdown"] = true,
  --       ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
  --     },
  --   },
  --   -- you can enable a preset for easier configuration
  --   presets = {
  --     bottom_search = true, -- use a classic bottom cmdline for search
  --     command_palette = true, -- position the cmdline and popupmenu together
  --     long_message_to_split = true, -- long messages will be sent to a split
  --     inc_rename = false, -- enables an input dialog for inc-rename.nvim
  --     lsp_doc_border = false, -- add a border to hover docs and signature help
  --   },
  -- })

  -- format on save
  -- vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

  local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
     -- require("go.format").goimports()
      vim.lsp.buf.format()
    end,
    group = format_sync_grp,
  })

  local sources = {
    "user.plugins.whichkey", -- load first
    "user.plugins.hop",
    "user.plugins.tmux-navigation",
  }

  for _, source in ipairs(sources) do
    local status_ok, fault = pcall(require, source)
    if not status_ok then
      vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault)
    end
  end


end

return M

return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  { import = "nvchad.blink.lazyspec" },

  -- {
  --   "L3MON4D3/LuaSnip",
  --   config = function()
  --     require("luasnip.loaders.from_vscode").lazy_load()
  --     require("configs.luasnip.init") -- load your custom snippet loader
  --   end,
  -- },
  --
  -- seamless navigation between tmux panes and vim splits
  { "alexghergh/nvim-tmux-navigation", 
    lazy = false,
    config = function()
      require("nvim-tmux-navigation").setup({})
    end,
  },

  -- Hop (better EasyMotion)
  {
    "smoka7/hop.nvim",
    version = "*",
    lazy = false,
    config = function()
      require("hop").setup({
        -- You can customize Hop's behavior here, e.g.,
        -- keys = "etovxqpdygfblzhckisuran",
        keys = "uhetonasidyfpgcrlxbkmjwqvz",
      })
    end,
  },

  -- debugger
  { 
    "rcarriga/nvim-dap-ui", 
    dependencies = {
      -- "mfussenegger/nvim-dap", 
      "nvim-neotest/nvim-nio"
    },
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,

    -- vim.fn.sign_define("DapBreakpoint", { text = "🔴" })
    -- vim.fn.sign_define("DapStopped", { text = "⚡" })

  },
  {
    "mfussenegger/nvim-dap",
    lazy = true, -- Loads the plugin only when needed
    dependencies = {
      "rcarriga/nvim-dap-ui", -- Optional, but highly recommended for UI
      "theHamsta/nvim-dap-virtual-text", -- inline values
    },
    keys = {
      { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint 🐛" },
      { "<leader>dc", function() require("dap").continue() end, desc = "Continue 🐛" },
      { "<leader>dT", function() require("dap").terminate() end, desc = "Terminate 🐛" },
      { "<leader>do", function() require("dap").step_over() end, desc = "Step Over 🐛" },
      { "<leader>di", function() require("dap").step_into() end, desc = "Step Into 🐛" },
    },
    config = function()
      require("dapui").setup({})
      require("dap-python").setup("/usr/bin/python3")
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    ---@type MasonNvimDapSettings
    opts = {
      -- This line is essential to making automatic installation work
      handlers = {},
      automatic_installation = {
        -- These will be configured by separate plugins.
        exclude = {
          "delve",
          "python",
        },
      },
      -- DAP servers: Mason will be invoked to install these if necessary.
      ensure_installed = {
        "bash",
        "python",
      },
    },
    dependencies = {
      "mfussenegger/nvim-dap",
      "williamboman/mason.nvim",
    },
    config = function()
      require("mason-nvim-dap").setup({})
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
    lazy = true, -- Loads the plugin only when needed
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    -- config = function()
    --   require("dap-python").setup("/usr/bin/python3")
    -- end,
  },



  {
    "kylechui/nvim-surround",
    version = "^3.0.0",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end
  },

  --
  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}

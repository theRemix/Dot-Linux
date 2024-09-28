-----------------------------------------------------------
-- Plugins
-----------------------------------------------------------
table.insert(lvim.plugins, { "AckslD/swenv.nvim" }) -- switch venv from without restarting
table.insert(lvim.plugins, { "mfussenegger/nvim-dap-python" }) -- nvim-dap extension to test and debug python
table.insert(lvim.plugins, { "nvim-neotest/neotest-python" }) -- neotest support for python

-----------------------------------------------------------
-- Config
-----------------------------------------------------------

-- automatically install python syntax highlighting
lvim.builtin.treesitter.ensure_installed = {
	"python",
}

-- setup formatting
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({ { name = "black" } })
-- lvim.format_on_save.enabled = true
-- lvim.format_on_save.pattern = { "*.py" }

-- setup linting
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({ { command = "flake8", filetypes = { "python" } } })

-- setup debug adapter
lvim.builtin.dap.active = true
local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")
pcall(function()
	require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
end)

-- setup testing
require("neotest").setup({
	adapters = {
		require("neotest-python")({
			-- Extra arguments for nvim-dap configuration
			-- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
			dap = {
				justMyCode = false,
				console = "integratedTerminal",
			},
			args = { "--log-level", "DEBUG", "--quiet" },
			runner = "pytest",
		}),
	},
})

-----------------------------------------------------------
-- Which-Key Config
-----------------------------------------------------------
local which_key = lvim.builtin.which_key

local lang_key = "p"
local mappings = {
	name = "Python  ",
	t = { "<cmd>lua require('dap-python').test_method()<cr>", "Test Method" },
	T = { "<cmd>lua require('dap-python').test_class()<cr>", "Test Class" },
	d = { "<cmd>lua require('dap-python').debug_selection()<cr>", "Debug Selection" },
}

which_key.mappings[which_key.language_prefix][lang_key] = mappings

-- binding for debugging

lvim.builtin.which_key.mappings["dm"] = { "<cmd>lua require('neotest').run.run()<cr>", "Test Method" }
lvim.builtin.which_key.mappings["dM"] =
	{ "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", "Test Method DAP" }
lvim.builtin.which_key.mappings["df"] = {
	"<cmd>lua require('neotest').run.run({vim.fn.expand('%')})<cr>",
	"Test Class",
}
lvim.builtin.which_key.mappings["dF"] = {
	"<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>",
	"Test Class DAP",
}
lvim.builtin.which_key.mappings["dS"] = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Test Summary" }

-- binding for switching venv
lvim.builtin.which_key.mappings["C"] = {
	name = "Python",
	c = { "<cmd>lua require('swenv.api').pick_venv()<cr>", "Choose Env" },
}

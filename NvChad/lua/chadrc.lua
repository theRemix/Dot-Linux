-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.plugins = {
  -- ["folke/which-key.nvim"] = {
  --   override_options = function()
  --     return {
  --       -- Your custom WhichKey settings go here
  --       -- delay = 200,
  --
  --       -- Example: Define custom mappings or override existing ones
  --       -- This example adds a custom mapping for <leader>t
  --       spec = {
  --         { "<leader>t", group = "Test Group" },
  --         { "<leader>ta", "<cmd>echo 'Hello from WhichKey!'<CR>", desc = "Say Hello" },
  --       },
  --     }
  --   end,
  -- },

  -- seamless navigation between tmux panes and vim splits
  -- ["alexghergh/nvim-tmux-navigation"] = {
  --   config = function()
  --     require "configs.tmux-navigation"
  --   end,
  -- },

  -- ["smoka7/hop.nvim"] = {
  --   version = "*",
  --   config = function()
  --     require("hop").setup({
  --       -- You can customize Hop's behavior here, e.g.,
  --       -- keys = "etovxqpdygfblzhckisuran",
  --     })
  --   end,
  -- },

}

M.base46 = {
	theme = "everblush",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
-- }

return M

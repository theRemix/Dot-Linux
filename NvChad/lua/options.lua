require "nvchad.options"

vim.g.lua_snippets_path = vim.fn.stdpath "config" .. "/lua/configs/snippets"

-- word separators
vim.opt.iskeyword:remove({","})

function _G.toggle_diagnostics()
  if vim.diagnostic.is_enabled() then
    vim.diagnostic.disable()
    print("Diagnostics Disabled")
  else
    vim.diagnostic.enable()
    print("Diagnostics Enabled")
  end
end

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

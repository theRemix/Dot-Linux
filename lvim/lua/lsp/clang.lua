vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "clangd" })

local ok, lsp_manager = pcall(require, "lvim.lsp.manager")
if ok then
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.offsetEncoding = { "utf-16" }
	lsp_manager.setup("clangd", {
		on_init = require("lvim.lsp").common_on_init,
		capabilities = capabilities,
	})
end

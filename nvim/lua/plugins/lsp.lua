-- In lua/plugins/lsp.lua

return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v3.x",
	dependencies = {
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local lsp_zero = require("lsp-zero")

		lsp_zero.on_attach(function(client, bufnr)
			-- This sets up all the standard keymaps for LSP features.
			-- It will apply to every server, including lua_ls.
			lsp_zero.default_keymaps({ buffer = bufnr })
		end)

		require("mason").setup({})

		-- This table centrally manages which LSPs you want installed.
		local servers_to_install = {
			"lua_ls",
			"pyright",
			"vimls",
		}

		require("mason-lspconfig").setup({
			ensure_installed = servers_to_install,
			handlers = {
				-- This is the default handler. It will be used for all servers
				-- that don't have a specific handler defined below.
				-- It calls lsp_zero.default_setup() to attach the server.
				lsp_zero.default_setup,

				-- THIS IS THE CRITICAL PART FOR YOUR PROBLEM:
				-- We define a specific handler for lua_ls.
				["lua_ls"] = function()
					-- This helper function from lsp-zero returns a table of settings
					-- pre-configured for Neovim, including telling lua-ls about the `vim` global.
					local lua_opts = lsp_zero.nvim_lua_ls()
					-- We then start lua_ls with these special options.
					require("lspconfig").lua_ls.setup(lua_opts)
				end,
			},
		})
	end,
}

-- In lua/plugins/formatting.lua
return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" }, -- Run on save
	cmd = { "ConformInfo" },
	opts = {
		-- Define your formatters
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			html = { "prettier" },
			css = { "prettier" },
			markdown = { "prettier" },
			-- Conform will run multiple formatters sequentially
			-- go = { "gofmt", "goimports" },
		},
		-- Set up format-on-save
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true, -- Fallback to LSP formatting if conform isn't configured
		},
	},
	init = function()
		-- Add a keymap to format the buffer
		vim.api.nvim_create_user_command("Format", function(args)
			require("conform").format({ async = true, lsp_fallback = true })
		end, {
			-- Add a description for which-key
			desc = "Format buffer",
		})
		vim.keymap.set({ "n", "v" }, "<leader>f", "<cmd>Format<cr>", { desc = "Format buffer" })
	end,
}

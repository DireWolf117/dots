-- In lua/plugins/flutter.lua

return {
	"nvim-flutter/flutter-tools.nvim",
	-- This is a great optimization! The plugin will only be loaded when you open a file of type 'dart'.
	ft = "dart",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim", -- Optional: for a nicer UI on things like `FlutterRename`
	},
	config = function()
		require("flutter-tools").setup({
			-- flutter-tools integrates with nvim-lspconfig automatically.
			-- It will detect the `dartls` server that mason-lspconfig sets up
			-- and enhance it with Flutter-specific capabilities (like the device selector, hot reload, etc).
			lsp = {
				-- You can override settings here if needed.
				-- For example, to enable specific analyses.
				-- settings = {
				--   showTodos = true,
				--   completeFunctionCalls = true,
				-- }
			},
		})
	end,
}

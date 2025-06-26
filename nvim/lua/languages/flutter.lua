return {
	"nvim-flutter/flutter-tools.nvim",
	lazy = true, -- Or you can set this to 'ft = "dart"' to only load on dart files
	dependencies = {
		"nvim-lua/plenary.nvim",
		"mfussenegger/nvim-dap", -- Required for debugging
		"stevearc/dressing.nvim", -- Optional, for a nicer UI
	},
	-- 'config = true' is the recommended shorthand for the default setup
	config = true,
}

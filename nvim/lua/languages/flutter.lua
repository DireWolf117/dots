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
			decorations = {
				statusline = {
					app_version = false,
					device = true,
					project_config = false,
				},
			},
			flutter_path = "/home/rialyze/Dev/flutter/bin/flutter", -- <-- this takes priority over the lookup
			-- fvm = true,
			-- flutter_lookup_cmd = "$(which flutter)", -- example "dirname $(which flutter)" or "asdf where flutter"
			-- flutter-tools integrates with nvim-lspconfig automatically.
			-- It will detect the `dartls` server that mason-lspconfig sets up
			lsp = {
				color = { -- show the derived colours for dart variables
					enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
					background = false, -- highlight the background
					background_color = nil, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
					foreground = false, -- highlight the foreground
					virtual_text = true, -- show the highlight using virtual text
					virtual_text_str = "■", -- the virtual text character to highlight
				},
				-- see the link below for details on each option:
				-- https://github.com/dart-lang/sdk/blob/master/pkg/analysis_server/tool/lsp_spec/README.md#client-workspace-configuration
				settings = {
					showTodos = true,
					completeFunctionCalls = true,
					analysisExcludedFolders = { "<path-to-flutter-sdk-packages>" },
					renameFilesWithClasses = "prompt", -- "always"
					enableSnippets = true,
					updateImportsOnRename = true, -- Whether to update imports and other directives when files are renamed. Required for `FlutterRename` command.
				},
			},
		})
	end,
}

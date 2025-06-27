return {
	--{
	--  "zbirenbaum/copilot.lua",
	--  cmd = "Copilot",
	--  event = "VimEnter",
	--  config = function()
	--    require("copilot").setup({
	--      panel = {
	--        enabled = true,
	--        auto_refresh = false,
	--        keymap = {
	--          jump_prev = "[[",
	--          jump_next = "]]",
	--          accept = "<CR>",
	--          refresh = "gr",
	--          open = "<M-CR>",
	--        },
	--      },
	--      suggestion = {
	--        enabled = true,
	--        -- Disable auto-trigger
	--        auto_trigger = false,
	--        debounce = 75,
	--        keymap = {
	--          -- Use these keys to manually trigger and cycle through suggestions
	--          next = "<M-l>",
	--          prev = "<M-h>",
	--          -- Use Tab to accept the suggestion
	--          accept = "<Tab>",
	--          dismiss = "<Esc>",
	--        },
	--      },
	--      filetypes = {
	--        yaml = true,
	--        markdown = true,
	--        -- Add any other filetypes you need
	--        ["*"] = true, -- Enable for all filetypes by default
	--      },
	--    })
	--  end,
	--},
	{
		"supermaven-inc/supermaven-nvim",
		config = function()
			require("supermaven-nvim").setup({
				keymaps = {
					accept_suggestion = "<Right>",
					-- clear_suggestion = "<C-]>",
					accept_word = "<Left>",
				},
				-- ignore_filetypes = { cpp = true }, -- or { "cpp", }
				color = {
					suggestion_color = "#9aa5ce",
					cterm = 244,
				},
				log_level = "info", -- set to "off" to disable logging completely
				disable_inline_completion = false, -- disables inline completion for use with cmp
				disable_keymaps = false, -- disables built in keymaps for more manual control
				condition = function()
					return false
				end,
			})
			vim.keymap.set("n", "<leader>sm", "<cmd>SupermavenToggle<CR>")
		end,
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "main",
		dependencies = {
			{ "zbirenbaum/copilot.lua" },
			{ "nvim-lua/plenary.nvim" },
		},
		build = "make tiktoken",
		opts = {
			sticky = {
				"#buffer", -- This will use the current file as context
			},
		},
		keys = {
			{ "<leader>cc", "<cmd>CopilotChat<CR><cmd>CopilotChatPrintModel<CR>", desc = "Copilot Chat" },
			{ "<leader>cr", "<cmd>CopilotChatReset<CR>", desc = "Copilot Chat Reset" },
		},
	},
}

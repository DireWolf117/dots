return {
	"folke/tokyonight.nvim",
	"EdenEast/nightfox.nvim", -- Adding nightfox for flexibility
	config = function()
		require("nightfox").setup({
			palettes = {
				carbonfox = {
					bg1 = "#000000", -- Darker background shade
				},
			},
		})
	end,
	lazy = false,
	priority = 1000,
	opts = {
		styles = {
			comments = { italic = false },
			keywords = { italic = false },
			functions = { italic = false },
			variables = { italic = false },
			backgrounds = {
				default = "#101010", -- Darker background
			},
			sidebars = "transparent",
		},
	},
}

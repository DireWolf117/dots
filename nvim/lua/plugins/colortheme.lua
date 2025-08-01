return {
	"folke/tokyonight.nvim",
	"EdenEast/nightfox.nvim",
	config = function()
		-- Available themes configuration
		local themes = {
			tokyonight = function()
				require("tokyonight").setup({
					style = "night",
					styles = {
						comments = { italic = false },
						keywords = { italic = false },
						functions = { italic = false },
						variables = { italic = false },
						sidebars = "transparent",
					},
				})
				vim.cmd([[colorscheme tokyonight]])
			end,
			carbonfox = function()
				require("nightfox").setup({
					palettes = {
						carbonfox = {
							bg1 = "#010101", -- Darker background shade
						},
					},
				})
				vim.cmd([[colorscheme carbonfox]])
			end,
		}
		-- Choose your theme here
		local current_theme = "carbonfox" -- Change this to switch themes
		if themes[current_theme] then
			themes[current_theme]()
		else
			vim.notify("Theme '" .. current_theme .. "' not found, falling back to carbonfox")
			themes.carbonfox()
		end
	end,
	lazy = false,
	priority = 1000,
}

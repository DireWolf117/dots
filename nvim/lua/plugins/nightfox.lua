return {
	"EdenEast/nightfox.nvim",
	config = function()
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

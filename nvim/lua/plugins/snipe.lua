return {
	"leath-dub/snipe.nvim",
	keys = {
		{
			"ff",
			function()
				require("snipe").open_buffer_menu()
			end,
			desc = "Open Snipe buffer menu",
		},
	},
	opts = {
		ui = {
			max_height = -1, -- -1 means dynamic height
			-- Where to place the ui window
			-- Can be any of "topleft", "bottomleft", "topright", "bottomright", "center", "cursor" (sets under the current cursor pos)
			position = "center",
			-- Override options passed to `nvim_open_win`
			-- Be careful with this as snipe will not validate
			-- anything you override here. See `:h nvim_open_win`
			-- for config options
			open_win_override = {
				-- title = "My Window Title",
				border = "none", -- use "rounded" for rounded border
			},
		},
		sort = "last",
	},
}

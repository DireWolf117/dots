-- lua/plugins/project.lua

return {
	"ahmedkhalf/project.nvim",
	config = function()
		require("project_nvim").setup({
			-- your configuration comes here
			-- or leave it empty to use the default settings
		})
		require("telescope").load_extension("projects")
	end,
}

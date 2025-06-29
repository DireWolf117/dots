require("core.options")
require("core.keymaps")
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require("lazy").setup({
	require("plugins.colortheme"),
	require("plugins.neotree"),
	require("plugins.treesitter"),
	require("plugins.telescope"),
	require("plugins.ai"),
	require("plugins.formatting"),
	require("plugins.completions"),
	require("plugins.alpha"),
	require("plugins.lsp"),
	require("plugins.snipe"),
	require("plugins.trouble"),
	require("plugins.projects"),
	require("plugins.symbols"),
	-- language plugins
	require("languages.flutter"),
})

-- Color scheme setting
vim.cmd([[colorscheme tokyonight-night]])

-- tmux indicator that file is modified
vim.api.nvim_create_autocmd({ "BufEnter", "BufFilePost", "BufModifiedSet" }, {
	pattern = "*",
	callback = function()
		local modified = vim.o.modified and " [+]" or ""
		vim.o.titlestring = " " .. vim.fn.expand("%") .. modified
		vim.o.title = true
	end,
})

-- highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
	end,
})

-- In your init.lua or a dedicated keymaps file
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics<cr>", { silent = true, noremap = true })

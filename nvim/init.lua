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
	require("plugins.treesitter"),
	require("plugins.telescope"),
	require("plugins.formatting"),
	require("plugins.completions"),
	require("plugins.alpha"),
	require("plugins.lsp"),
	require("plugins.snipe"),
	require("plugins.trouble"),
	require("plugins.projects"),
	require("plugins.symbols"),
	require("plugins.autopairs"),
	require("plugins.oil"),
	require("plugins.lspkind"),
	require("plugins.incline"),
	require("plugins.undotree"),
	require("plugins.zellij"),
	-- language plugins
	require("languages.flutter"),
})

-- Color scheme setting
vim.cmd([[colorscheme carbonfox]])
-- highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
	end,
})

-- In your init.lua or a dedicated keymaps file
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics<cr>", { silent = true, noremap = true })

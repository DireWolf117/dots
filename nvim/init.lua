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
	require("plugins.lsp"),
	require("plugins.ai"),
	require("plugins.formatting"),
	require("languages.flutter"),
	require("plugins.completions"),
	require("plugins.alpha"),
	require("plugins.bufferline"),
})

-- Color scheme setting
vim.cmd([[colorscheme tokyonight-moon]])

-- Custom command to print the current Copilot model
vim.api.nvim_create_user_command("CopilotChatPrintModel", function()
	require("plenary.async").run(function()
		local model = require("CopilotChat").resolve_model()
		-- The model name is printed to the command line area
		print("Current Copilot Model: " .. model)
	end)
end, {})

vim.api.nvim_create_autocmd({ "BufEnter", "BufFilePost" }, {
	pattern = "*",
	callback = function()
		vim.o.titlestring = " " .. vim.fn.expand("%")
		vim.o.title = true
	end,
})

return {
	"freddiehaddad/feline.nvim",
	opts = {},
	config = function()
		local ctp_feline = require("catppuccin.groups.integrations.feline")

		ctp_feline.setup()

		require("feline").setup({
			components = ctp_feline.get(),
		})
	end,
}

-- return {
-- 	"nvim-lualine/lualine.nvim",
-- 	dependencies = { "nvim-tree/nvim-web-devicons" },
-- 	config = function()
-- 		require("lualine").setup({
-- 			options = {
-- 				theme = "catppuccin",
-- 			},
-- 		})
--
-- 		vim.o.laststatus = 3
-- 	end,
-- }

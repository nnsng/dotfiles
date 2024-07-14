return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
		})

		vim.o.termguicolors = true
		vim.cmd([[colorscheme catppuccin]])
	end,
}

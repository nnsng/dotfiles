if true then return {} else end

return {
	"akinsho/bufferline.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	after = "catppuccin",
	config = function()
		require("bufferline").setup({
			options = {
				mode = "tabs",
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						separator = false,
					},
				},
			},
			highlights = require("catppuccin.groups.integrations.bufferline").get(),
		})
	end,
}

return {
	"nvim-treesitter",
	for_cat = "general.core",

	after = function(_)
		require("nvim-treesitter.config").setup({
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}

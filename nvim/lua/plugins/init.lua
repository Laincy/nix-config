local lze = require("lze")

lze.load({
	{
		"neo-tree.nvim",
		for_cats = "general",
		keys = {
			{ "<C-n>", ":Neotree toggle left<CR>", mode = { "n" }, desc = "Neotree toggle" },
		},

		after = function(_)
			require("neo-tree").setup({
				close_if_last_window = true,
				filesystem = {
					filtered_items = { hide_dotfiles = false, never_show = { ".git" } },
				},

				window = { width = 30 },
			})
		end,
	},

	{
		"lualine.nvim",
		for_cat = "general.extra",
		event = "DeferredUIEnter",

		after = function(_)
			require("lualine").setup({
				options = {
					theme = "rose-pine",
					component_seperators = "|",
					section_seperators = "",
					globalstatus = true,
				},
			})
		end,
	},

	{
		"markview.nvim",
		for_cats = "markdown",

		enabled = nixCats("markdown") or false,

		after = function()
			local presets = require("markview.presets")

			require("markview").setup({
				markdown = {
					headings = presets.headings.marker,
					tables = presets.tables.single,
				},
			})
		end,
	},

	{ import = "plugins.telescope" },
	{ import = "plugins.treesitter" },
	{ import = "plugins.codestyle" },
})

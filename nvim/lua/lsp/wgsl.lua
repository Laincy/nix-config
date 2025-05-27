return {
	"wgsl_analyzer",
	lsp = {
		enabled = nixCats("rust") or false,
		filetypes = { "wgsl" },
		cmd = { "wgsl-analyzer" },

		settings = {
			["wgsl-analyzer"] = {},
		},
	},
}

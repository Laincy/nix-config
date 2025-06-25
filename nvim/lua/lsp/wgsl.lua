return {
	"wgsl_analyzer",
	lsp = {
		enabled = nixCats("rust") or false,
		filetypes = { "wgsl" },
		settings = {
			["wgsl-analyzer"] = {},
		},
	},
}

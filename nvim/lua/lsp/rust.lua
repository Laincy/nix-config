return {
	"rust_analyzer",
	lsp = {
		enabled = nixCats("rust") or false,
		filetypes = { "rust" },

		settings = {
			["rust-analyzer"] = {},
		},
	},
}

return {
	"zls",
	enabled = nixCats("zig") or false,
	lsp = {
		enabled = nixCats("zig") or false,
		fileTypes = { "zig" },

		settings = {},
	},
}

return {
	"zls",
	lsp = {
		enabled = nixCats("zig") or false,
		fileTypes = { "zig" },

		settings = {
			zls = {
				zig_exe_path = nixCats.extra("zig-path"),
			},
		},
	},
}

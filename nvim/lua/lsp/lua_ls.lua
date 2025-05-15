return {
	"lua_ls",
	lsp = {
		enabled = nixCats("lua") or false,
		fileTypes = { "lua" },

		settings = {
			Lua = {
				formatters = {
					ignoreComments = true,
				},
				signatureHelp = { enabled = true },
				diagnostics = {
					globals = { "nixCats", "vim" },
					disable = { "missing-fields" },
				},
				telemetry = { enabled = false },
			},
		},
	},
}

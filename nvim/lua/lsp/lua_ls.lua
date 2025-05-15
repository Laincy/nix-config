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

				inlay_hints = {
					enabled = true,
					show_type_hints = true,
					show_parameter_hints = true,
					show_other_hints = true,
				},
				telemetry = { enabled = false },
			},
		},
	},
}

return {
	"sqls",
	lsp = {
		enabled = nixCats("sql") or false,
		fileTypes = { "sql" },

		settings = {
			sqls = {},
		},
	},
}

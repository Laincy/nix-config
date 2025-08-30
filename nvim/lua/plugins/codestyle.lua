-- Formatting and linting
return {
	{
		"conform.nvim",
		for_cat = "general.style",
		keys = { "<leader>fmt", desc = "Format file" },

		after = function()
			local conform = require("conform")

			conform.setup({
				formatters_by_ft = {
					lua = nixCats("lua") and { "stylua" } or nil,
					nix = nixCats("nix") and { "alejandra" } or nil,
					zig = nixCats("zig") and { "zigfmt" } or nil,
					sql = nixCats("sql") and { "sql_formatter" } or nil,

					markdown = nixCats("markdown") and { "markdownlint" } or nil,
				},
			})

			vim.keymap.set({ "n", "v" }, "<leader>fmt", function()
				conform.format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 1000,
				})
			end, { desc = "Format file" })
		end,
	},
	{
		"nvim-lint",
		for_cat = "general.style",

		event = "FileType",
		after = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				markdown = nixCats("markdown") and { "markdownlint" } or nil,

				gitcommit = { "commitlint" },
				nix = nixCats("nix") and { "nix" } or nil,

				rust = nixCats("rust") and { "clippy" } or nil,
			}

			lint.linters.markdownlint.args = { "--stdin", "--disable", "MD013", "MD041" }

			vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},
}

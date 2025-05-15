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

			local efm = "%f:%l:%c %m,%f:%l %m"

			lint.linters_by_ft = {
				markdown = nixCats("markdown") and {
					"markdownlint-cli2",
				} or nil,
			}

			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},
}

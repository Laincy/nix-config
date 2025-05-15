local lsp_on_attach = function(_, buffnr)
	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end

		vim.keymap.set("n", keys, func, { buffer = buffnr, desc = desc })
	end

	nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
	nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

	nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")

	nmap("gr", function()
		require("telescope.builtin").lsp_references()
	end, "[G]oto references")

	nmap("gu", function()
		require("telescope.builtin").lsp_implementations()
	end, "[G]et [U]sages")

	nmap("<leader>ds", function()
		require("telescope.builtin").lsp_document_symbols()
	end, "[D]ocument [S]ymbols")

	nmap("K", vim.lsp.buf.hover, "Hover Documentation")
	nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

	vim.api.nvim_buf_create_user_command(buffnr, "Format", function(_)
		vim.lsp.buf.format()
	end, { desc = "Format current buffer with LSP" })
end

local lze = require("lze")

lze.register_handlers(require("lzextras").lsp)

lze.h.lsp.set_ft_fallback(function(name)
	return dofile(nixCats.pawsible({ "allPlugins", "opt", "nvim-lspconfig" }) .. "/lsp/" .. name .. ".lua").filetypes
		or {}
end)

lze.load({
	{
		"nvim-lspconfig",
		for_cats = "general",
		on_require = { "lspconfig" },

		lsp = function(plugin)
			vim.lsp.config(plugin.name, plugin.lsp or {})
			vim.lsp.enable(plugin.name)
		end,

		before = function(_)
			vim.lsp.config("*", {
				on_attach = lsp_on_attach,
			})
		end,
	},
	{ import = "lsp.lua_ls" },
	{ import = "lsp.nixd" },
})

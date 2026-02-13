return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier.with({}),
				require("none-ls.code_actions.eslint"),
			},
		})
		vim.keymap.set("n", "<leader>gf", function()
			vim.lsp.buf.format({
				async = true,
				filter = function(client)
					return client.name == "null-ls"
				end,
			})
		end, {})
	end,
}

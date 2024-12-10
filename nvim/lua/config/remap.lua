vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)


vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end)
		vim.keymap.set('n', '<C-k>', function() vim.lsp.buf.signature_help() end)
		vim.keymap.set('n', '<space>ld', function() vim.lsp.buf.type_definition() end)
		vim.keymap.set('n', '<space>lr', function() vim.lsp.buf.rename() end)
		vim.keymap.set({ 'n', 'v' }, '<space>la', function() vim.lsp.buf.code_action() end)
		vim.keymap.set('n', '<space>lf', function()
			vim.lsp.buf.format { async = true }
		end)
		vim.keymap.set('n', "<leader>li", function()
			vim.lsp.inlay_hint.enable(0, not vim.lsp.inlay_hint.is_enabled(0))
		end)
		vim.api.nvim_set_keymap('n', '<leader>do', '<cmd>lua vim.diagnostic.open_float()<CR>',
			{ noremap = true, silent = true })
		vim.api.nvim_set_keymap('n', '<leader>d[', '<cmd>lua vim.diagnostic.goto_prev()<CR>',
			{ noremap = true, silent = true })
		vim.api.nvim_set_keymap('n', '<leader>d]', '<cmd>lua vim.diagnostic.goto_next()<CR>',
			{ noremap = true, silent = true })
	end,
})

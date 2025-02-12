-- I'm not super sure what this does, but I know I need it!
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Open the folder enclosing the current file.
vim.keymap.set('n', '<leader>ed', ':EditDirectory<CR>', {desc = 'Open the directory of the current file'})

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Vim-test keybinds
vim.keymap.set('n', '<leader>t', function() vim.cmd([[TestNearest]]) end)
vim.keymap.set('n', '<leader>T', function() vim.cmd([[TestFile]]) end)
vim.keymap.set('n', '<leader>a', function() vim.cmd([[TestSuite]]) end)

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- Open lazygit
vim.keymap.set('n', '<leader>gg', function() vim.cmd([[LazyGit]]) end)

-- Copies whole file to clipboard
vim.keymap.set('n', '<leader>yy', function()
  vim.cmd([[ %y+ ]])
end)
  

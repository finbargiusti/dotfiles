-- use gg=G to format on save

vim.g.autoindent = false
vim.g.smartindent = false

local augroup = vim.api.nvim_create_augroup("AutoIndentOnSave", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup,
    pattern = "norg", -- should be redendant
    callback = function()
        local cursor_pos = vim.api.nvim_win_get_cursor(0)

        vim.cmd("normal! gg=G")

        vim.api.nvim_win_set_cursor(0, cursor_pos)
    end,
})

vim.api.nvim_command("augroup END")

-- default conceal level set to 3

vim.cmd([[set conceallevel=3]])

-- neorg kevbinds

vim.keymap.set('n', '<leader>nn', "<Plug>(neorg.dirman.new-note)", { desc = "[neorg] New note" })

vim.keymap.set('n', '<leader>id', "<Plug>(neorg.tempus.insert-date)", { desc = "[neorg] Insert the current date" })

vim.keymap.set('n', '<leader>c0', function() vim.cmd([[set conceallevel=0]]) end, { desc = "Conceal level 0" })
vim.keymap.set('n', '<leader>c3', function() vim.cmd([[set conceallevel=3]]) end, { desc = "Conceal level 3" })

vim.keymap.set('n', '>>', "<Plug>(neorg.promo.promote.nested)", { desc = "Promote nested" })
vim.keymap.set('n', '<<', "<Plug>(neorg.promo.demote.nested)", { desc = "Promote nested" })

vim.keymap.set('n', '<CR>', "<Plug>(neorg.esupports.hop.hop-link)", { desc = "Hop link" })
vim.keymap.set('n', '<M-t>', "<Plug>(neorg.esupports.hop.hop-link.tab-drop)", { desc = "Hop into tab" })

vim.keymap.set('i', '<M-CR>', "<Plug>(neorg.itero.next-iteration)", { desc = "Next iteration" })

vim.keymap.set('n', '<leader>td', "<Plug>(neorg.qol.todo-items.todo.task-done)", { desc = "Task done" })
vim.keymap.set('n', '<leader>tu', "<Plug>(neorg.qol.todo-items.todo.task-undone)", { desc = "Task undone" })
vim.keymap.set('n', '<leader>tp', "<Plug>(neorg.qol.todo-items.todo.task-pending)", { desc = "Task pending" })

-- disable wrap
vim.cmd([[setl nowrap]])

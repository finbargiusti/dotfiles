-- Open the folder enclosing the current file.
-- This will open into oil.nvim

vim.api.nvim_create_user_command('EditDirectory', function()

  local file_path = vim.fn.getreg('%')
  local dir = vim.fn.fnamemodify(file_path, ':p:h')
  vim.cmd('edit ' .. dir)

end, {desc = 'Open the directory of the current file'})

-- add abbreviated ed

vim.cmd('cnoreabbrev ed EditDirectory')

vim.api.nvim_create_user_command('SafeAbort', function()
  vim.cmd('wa')
  vim.cmd('qa')
end, {desc = 'Save all and quit'})

vim.cmd('cnoreabbrev qq SafeAbort')

vim.api.nvim_create_user_command('EditVimRC', function()
  vim.cmd('edit $MYVIMRC')
end, {desc = 'Edit the init.vim file'})

vim.cmd('cnoreabbrev evim EditVimRC')

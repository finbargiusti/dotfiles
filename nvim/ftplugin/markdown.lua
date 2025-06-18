-- we only want magic keybinds if the file is in the Notes folder.

local home = vim.fn.expand('~/Notes')

if not vim.fn.isdirectory(home) then
  return {}
end

if vim.fn.expand('%:p'):find(home, 1, true) == nil then
  return {}
end

vim.keymap.set('n', '<CR>', function()
  local link_pattern = '%[%[[%w%s/_-]+%]%]'
  -- check if the cursor is on a link
  local line = vim.api.nvim_get_current_line()
  local col = vim.api.nvim_win_get_cursor(0)[2] + 1
  local match_start, match_end = line:find(link_pattern, 1)
  vim.notify('match_start: ' .. tostring(match_start) .. ', match_end: ' .. tostring(match_end) .. ', col: ' .. tostring(col))
  if match_start and col >= match_start and col <= match_end then
    vim.cmd('Telekasten follow_link')
  else
    vim.cmd('normal! <CR>')
  end
end, {desc = 'Follow link' })

vim.keymap.set("i", "{{", "<cmd>Telekasten insert_link<CR>")

vim.keymap.set('n', '<leader>zz', '<cmd>Telekasten panel<cr>', { desc = 'TK Menu' })

vim.keymap.set('n', '<leader>zn', '<cmd>Telekasten new_note<cr>', { desc = 'New note' })

vim.keymap.set('n', '<leader>zf', '<cmd>Telekasten find_notes<cr>', { desc = 'New note' })

vim.keymap.set('i', '<A-Enter>', function() 
  -- This function create a new list item in markdown,
  -- or just creates a new line
  local line = vim.api.nvim_get_current_line()

  local todo_match = line:match('^%s*%-%s+%[.-%]')
  if todo_match then
    -- If the line starts with a todo item, add a new item
    vim.cmd [[ stopinsert ]]
    local input = 'o- [ ] '
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(input, true, false, true), 'n', true)
    return
  end

  local bullet_match = line:match('^%s*[-*]')
  if bullet_match then
    -- If the line starts with a bullet, add a new item
    vim.cmd [[ stopinsert ]]
    local input = 'o' .. bullet_match .. ' '
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(input, true, false, true), 'n', true)
    return
  end

  local number_match = line:match('^%s*%d+%.')
  if number_match then
    -- If the line starts with a numbered list, add a new item
    local next_number = tonumber(number_match:match('(%d+)')) + 1
    vim.cmd [[ stopinsert ]]
    local input = 'o' .. next_number .. '. '
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(input, true, false, true), 'n', true)
    return
  end

  vim.cmd('normal! o')
end, { desc = 'New Item' })

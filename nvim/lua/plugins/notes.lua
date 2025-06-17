return {
  {
    'renerocksai/telekasten.nvim',
    dependencies = {'nvim-telescope/telescope.nvim'},
    opts = {
      home = vim.fn.expand('~/Notes'),
      template_new_note = vim.fn.expand('~/Notes/templates/note.md'),
      dailies = vim.fn.expand('~/Notes/journal'),
      template_new_daily = vim.fn.expand('~/Notes/templates/daily.md'),
      journal_auto_open = true,
      media_previewer = 'viu-previewer',
      clipboard_program = 'wl-paste',
      image_subdir = 'images',
      install_syntax = false,
      auto_set_filetype = false,
    },
  },
}

-- keybinds defined in ../../ftplugin/markdown.lua

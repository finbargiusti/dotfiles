package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"

opts = {
  backend = "kitty",
  processor = "magick_cli", -- or "magick_cli"
  rocks = {
    enabled = false
  },
  integrations = {
    markdown = {
      enabled = true,
      clear_in_insert_mode = false,
      download_remote_images = true,
      only_render_image_at_cursor = false,
      floating_windows = false,              -- if true, images will be rendered in floating markdown windows
      filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
    },
    html = {
      enabled = false,
    },
    css = {
      enabled = false,
    },
  },
  max_width = 1024,
  max_height = 1024,
  scale_factor=1,
  max_width_window_percentage = 80,
  max_height_window_percentage = 100,
  window_overlap_clear_enabled = false,                                               -- toggles images when windows are overlapped
  editor_only_render_when_focused = true,                                            -- auto show/hide images when the editor gains/looses focus
  tmux_show_only_in_active_window = false,                                            -- auto show/hide images in the correct Tmux window (needs visual-activity off)
  hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" }, -- render image files as images when opened
  kitty_method = "normal",                                                           -- method to display images in kitty
}

return opts

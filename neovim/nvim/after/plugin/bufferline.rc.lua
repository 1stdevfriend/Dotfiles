local status, bufferline = pcall(require, 'bufferline')
if (not status) then return end

bufferline.setup {
  options = {
    mode = 'buffers',
    separator_style = 'slant',
    always_show_bufferline = false,
    show_buffer_close_icons = true,
    show_close_icons = false,
    color_icons = true,
    hover = {
      enabled = true,
      delay = 200,
      reveal = { 'close' }
    }
  },
  highlights = {
    separator = {
      fg = "#073642",
      bg = "#002b36",

    },
    separator_selected = {
      fg = "#073642"
    },
    background = {
      fg = "#657b83",
      bg = "#002b36"
    },
    buffer_selected = {
      fg = "#fdf6e3",
      underline = true,
      undercurl = true
    },
    fill = {
      fg = "#073642"
    }
  }
}

vim.api.nvim_set_keymap('n', '<Tab>', '<cmd>BufferLineCycleNext<CR>', {})
vim.api.nvim_set_keymap('n', 'S-<Tab>', '<cmd>BufferLineCyclePrev<CR>', {})

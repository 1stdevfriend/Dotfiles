local status, lualine = pcall(require, 'lualine')
if (not status) then return end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'solarized_dark',
    section_separators = { left = '◀ ', right = '▶ ' },
    component_separators = { left = '＜', right = '＞' },
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = { ' mode' },
    lualine_b = { 'branch' },
    lualine_c = { {
      'filename',
      file_staus = true, -- displays file statuss
      path = 0 --- 0  = just filename
    } },
    lualine_x = {
      { 'diagnostics', sources = { 'nvim_diagnostic' }, symbols = { error = 'E', warn = 'W', info = 'I', hint = 'H' } },
      'encoding',
      'filetype'
    },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { {
      'filename',
      file_status = true,
      path = 1 -- 1 = relative path
    } },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  }
}

-- TODO => Have to install nerf fonts on icons later on. For more, check symbols above. However, it can be copied from the neovim config video as well. Link - https://www.youtube.com/watch?v=ajmK0ZNcM4Q

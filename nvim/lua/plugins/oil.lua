return {
  'stevearc/oil.nvim',
  opts = {},
  keys = {
    {
      '\\',
      function()
        require('oil').open()
      end,
      mode = 'n',
      desc = 'Open parent directory',
    },
  },
  -- Optional dependencies
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('oil').setup({
      columns = { 'icon' },
      keymaps = {
        ['-'] = false,
        ['<bs>'] = 'actions.parent',
      },
      view_options = {
        show_hidden = true,
      },
    })
  end,
}

return { -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  config = function() -- This is the function that runs, AFTER loading
    require('which-key').setup()

    -- Document existing key chains
    require('which-key').register({
      ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
      ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
      ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
      ['<leader>n'] = { name = '[N]oice', _ = 'which_key_ignore' },
      ['['] = { name = 'Previous', _ = 'which_key_ignore' },
      [']'] = { name = 'Next', _ = 'which_key_ignore' },
      ['<leader>'] = { name = 'Leader', _ = 'which_key_ignore' },
      ['g'] = { name = 'LSP', _ = 'which_key_ignore' },
      ['s'] = { name = '[S]urrounding', _ = 'which_key_ignore' },
      ['z'] = { name = 'Fold/Line', _ = 'which_key_ignore' },
    })

    local keymap = vim.keymap

    keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

    -- Diagnostic keymaps
    keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
    keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
    keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
    keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

    keymap.set({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save File' })

    keymap.set({ 'n', 't' }, '<C-\\>', require('util.terminal').open, { silent = true, desc = 'Open/Close Terminal' })
  end,
}

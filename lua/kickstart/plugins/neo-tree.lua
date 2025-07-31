-- Neo-tree configuration with toggle and focus keybinds
return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- recommended
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
    {
      '<Space>t',
      function()
        require('neo-tree.command').execute { toggle = true, dir = vim.loop.cwd() }
      end,
      desc = 'NeoTree Toggle',
      silent = true,
    },
    {
      '<Space>f',
      function()
        local state = require('neo-tree.sources.manager').get_state 'filesystem'
        if state and state.current_position then
          if vim.api.nvim_get_current_win() == state.winid then
            vim.cmd.wincmd 'p' -- go to previous window
          else
            vim.api.nvim_set_current_win(state.winid)
          end
        end
      end,
      desc = 'NeoTree Focus Toggle',
      silent = true,
    },
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    },
  },
}

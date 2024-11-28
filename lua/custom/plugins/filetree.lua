return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  keys = {
    { '<leader>e', '<cmd>Neotree toggle<cr>', desc = 'Toggle File Explorer' },
    { '<leader>o', '<cmd>Neotree focus<cr>', desc = 'Focus File Explorer' },
  },
  opts = {
    filesystem = {
      follow_current_file = true,
      hijack_netrw_behavior = 'open_current',
    },
  },
  config = function()
    require('neo-tree').setup {}
  end,
}

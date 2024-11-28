return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  keys = {
    { '<leader>n', '<cmd>Notes<CR>', desc = 'Toggle Quick Notes' },
  },
  config = function()
    local notes_text = [[
# Common Neovim Commands

## File Navigation
<leader>sf  - Search Files
<leader>sg  - Search by Grep (content)
<leader>s.  - Recent files
<leader>e   - Toggle file explorer

## Windows/Splits
<C-h>       - Move to left split
<C-l>       - Move to right split
<C-j>       - Move to split below
<C-k>       - Move to split above

## Code
<leader>th  - [T]oggle [H]ints
gd          - [G]o to [D]efinition
gr          - Find references
K           - Show documentation
<leader>ca  - [C]ode [A]ctions
<leader>rn  - [R]e[N]ame symbol

## Search
/           - Search in file
<leader>/   - Fuzzy search in current buffer
<leader>sh  - Search help
    ]]

    -- Create the floating window function
    local function show_notes()
      --Calculate window size
      local width = 60
      local height = 20

      -- Calculate starting position
      local row = (vim.o.lines - height) / 2
      local col = (vim.o.columns - width) / 2

      -- Create buffer for the notes
      local buf = vim.api.nvim_create_buf(false, true)

      -- Set buffer contents
      vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.split(notes_text, '\n'))

      -- Set buffer options
      vim.bo[buf].modifiable = false
      vim.bo[buf].filetype = 'markdown'

      -- Set up the window
      local win_opts = {
        relative = 'editor',
        row = row,
        col = col,
        width = width,
        height = height,
        style = 'minimal',
        border = 'rounded',
        title = ' My Neovim Notes ',
        title_pos = 'center',
      }

      -- Create the window
      local win = vim.api.nvim_open_win(buf, true, win_opts)

      -- Ser window options
      vim.wo[win].cursorline = true
      vim.wo[win].wrap = false

      -- Add keymaps to close the window
      vim.api.nvim_buf_set_keymap(buf, 'n', 'q', ':q<CR>', { noremap = true, silent = true })
      vim.api.nvim_buf_set_keymap(buf, 'n', '<Esc>', ':q<CR>', { noremap = true, silent = true })
    end

    -- Create the command
    vim.api.nvim_create_user_command('Notes', show_notes, {})
  end,
  opts = {
    plugins = {
      marks = true,
      registers = true,
      spelling = {
        enable = false,
      },
      presets = {
        operations = false,
        motions = false,
        text_objects = false,
        windows = false,
        nav = false,
        z = false,
        g = false,
      },
    },
  },
}

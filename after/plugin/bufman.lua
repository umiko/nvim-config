local opts = {noremap = true}
local map = vim.keymap.set
-- Setup
require("buffer_manager").setup({
  select_menu_item_commands = {
    v = {
      key = "<C-v>",
      command = "vsplit"
    },
    h = {
      key = "<C-h>",
      command = "split"
    }
  },
  focus_alternate_buffer = false,
  short_file_names = false,
  short_term_names = false,
  loop_nav = true,
})
local bmui = require("buffer_manager.ui")
-- Just the menu
map({ 't', 'n' }, '<leader>bm', bmui.toggle_quick_menu, opts)
-- Open menu and search
map({ 't', 'n' }, '<M-m>', function ()
  bmui.toggle_quick_menu()
  -- wait for the menu to open
  vim.defer_fn(function ()
   vim.fn.feedkeys('/')
  end, 50)
end, opts)
-- Next/Prev
map('n', '<M-j>', bmui.nav_next, opts)
map('n', '<M-k>', bmui.nav_prev, opts)

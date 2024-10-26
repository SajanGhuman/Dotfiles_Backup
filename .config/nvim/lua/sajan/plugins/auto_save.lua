return {
  '0x00-ketsu/autosave.nvim',
  -- lazy-loading on events
  event = { "InsertLeave", "TextChanged" },
  config = function()
    require('autosave').setup {
    }
  end,
  conditions = {
    exists = true,
    modifiable = true,
    filename_is_not = {},
    filetype_is_not = { 'harpoon' }
  },
}


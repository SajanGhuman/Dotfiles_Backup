return {
  {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
      -- Set Gruvbox Material options
      vim.g.gruvbox_material_background = 'soft'        -- Set background to 'soft'
      vim.g.gruvbox_material_foreground = 'material'    -- Set foreground palette to 'material'
      vim.g.gruvbox_material_enable_italic = true       -- Enable italic fonts
      vim.g.gruvbox_material_disable_italic_comment = 0 -- Enable italic comments
      vim.g.gruvbox_material_enable_bold = 1            -- Enable bold in function names

      -- Ensure termguicolors is set for true color support
      if vim.fn.has('termguicolors') == 1 then
        vim.opt.termguicolors = true
      end
      vim.opt.background = "dark" -- Set background to dark

      -- Apply the Gruvbox Material colorscheme
      vim.cmd('colorscheme gruvbox-material')
    end
  } }


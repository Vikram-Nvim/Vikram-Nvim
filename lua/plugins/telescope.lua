return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    dependencies = 'nvim-lua/plenary.nvim',
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      -- This is your opts table
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }
          }
        }
      }
      require("telescope").load_extension("ui-select")
    end
  }
}

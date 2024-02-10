return {
  'nanozuki/tabby.nvim',
  event = 'VeryLazy',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    vim.api.nvim_set_keymap("n", "<leader>ta", "<cmd>$tabnew<CR>", { noremap = true })
    vim.api.nvim_set_keymap("n", "<leader>tc", "<cmd>tabclose<CR>", { noremap = true })
    vim.api.nvim_set_keymap("n", "<leader>to", "<cmd>tabonly<CR>", { noremap = true })
    vim.api.nvim_set_keymap("n", "<leader>tn", "<cmd>tabn<CR>", { noremap = true })
    vim.api.nvim_set_keymap("n", "<leader>tp", "<cmd>tabp<CR>", { noremap = true })
    vim.api.nvim_set_keymap("n", "<leader>tmp", "<cmd>-tabmove<CR>", { noremap = true })
    vim.api.nvim_set_keymap("n", "<leader>tmn", "<cmd>+tabmove<CR>", { noremap = true })
    require('tabby.tabline').use_preset('active_wins_at_end', {
      -- theme = {
      --   fill = 'TabLineFill',
      --   head = 'TabLine',
      --   current_tab = 'TabLineSel',
      --   tab = 'TabLine',
      --   win = 'TabLine',
      --   tail = 'TabLine',
      -- },
      nerdfont = true,
      lualine_theme = "catppuccin",
      tab_name = {
        name_fallback = function(tabid)
          return tabid
        end,
      },
      buf_name = {
        mode = "'unique'|'relative'|'tail'|'shorten'",
      },
    })
  end,
}

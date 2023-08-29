require('opts')      -- Options
require('vars')
require('keys')
--LazyNvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup('plugins')
--LazyNvim
vim.cmd.colorscheme "catppuccin"
require("plugins.config.whichkey").setup()
-- require("plugs.confs.lspconfig").setup()
require 'colorizer'.setup()
require("nvim-tree").setup()
require("nvim-surround").setup()
require('gitsigns').setup()
require('neogit').setup()
require('diffview').setup()
require('notify').setup({
    background_colour = "NotifyBackground",
    fps = 30,
    icons = {
      DEBUG = "",
      ERROR = "",
      INFO = "",
      TRACE = "✎",
      WARN = ""
    },
    level = 2,
    minimum_width = 100,
    render = "compact",
    stages = "static",
    timeout = 3000,
    top_down = false,
  })
require("notify")("Welcome Buddy!")
require("telescope").load_extension("notify")
require("notify").history()

require('staline').setup({
  sections = {
		left = {
			-- ' ', 'right_sep_double', '-M', 'left_sep_double', ' ',
			-- 'right_sep',  '-file_name', 'left_sep', ' ',
			' ', 'right_sep_double', '-branch', 'left_sep_double', ' ',
		},
		mid  = {'right_sep_double', '-cool_symbol', 'left_sep_double'},
		right= {
			' ', 'right_sep_double', '-line_column', 'left_sep_double', ' ',
			-- 'right_sep', '- ', '-lsp_name', '- ', 'left_sep',
			-- 'right_sep_double', '-M', 'left_sep_double', ' ',
		}
	},

 defaults={
   fg = "#986fec",
   cool_symbol = " ＩＮＤＩＡ ",
   left_separator = "",
   right_separator = "",
   line_column = "  [%L]  ",
   true_colors = true,
   --line_column = "[%l:%c] | %p%% "
   font_active = "bold"
 },
 mode_colors = {
   n  = "#181a23",
   i  = "#181a23",
   ic = "#181a23",
   c  = "#181a23",
   v  = "#181a23"       -- etc
 }
})
require('stabline').setup({
  style = "slant",
  bg = "#2b2b2b",
  fg = "#986fec",
  stab_left   = "",
  stab_right  = "",
  inactive_bg = "#181a23",
  inactive_fg = "#aaaaaa",
})
require("harpoon").setup({
  menu = {
    width = vim.api.nvim_win_get_width(0) - 10,
  }
})

--LSP SETUP
require("mason").setup()
require("mason-lspconfig").setup({
 ensure_installed = {"html", "cssls", "tailwindcss", "marksman", }
})

local on_attach = function ()
 vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
 vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

 vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
 vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
 -- vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references {})
 vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").html.setup {
 on_attach = on_attach,
 -- capabilities = capabilities,
}
require("lspconfig").cssls.setup {
 on_attach = on_attach
}
require("lspconfig").tailwindcss.setup {
 on_attach = on_attach
}
require("lspconfig").marksman.setup {
 on_attach = on_attach
}

--AutoCompletions
local cmp = require('cmp')

require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
  completion = {
    completeopt = "menu,menuone",
  },
  -- preselect = cmp.PreselectMode.None,
  sources = cmp.config.sources {
    { name = "nvim_lsp", priority = 1000 },
    { name = "luasnip", priority = 750 },
    { name = "buffer", priority = 500 },
    { name = "path", priority = 250 },
  },
  duplicates = {
    nvim_lsp = 1,
    luasnip = 1,
    cmp_tabnine = 1,
    buffer = 1,
    path = 1,
  },

  window = {
    completion = cmp.config.window.bordered(border_opts),
    documentation = cmp.config.window.bordered(border_opts),
  },

  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },

  formatting = formatting_style,

  mapping = {
    ["<Up>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
    ["<Down>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
    ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
    ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
    ["<C-k>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
    ["<C-j>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
    ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
    ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-y>"] = cmp.config.disable,
    ["<C-e>"] = cmp.mapping { i = cmp.mapping.abort(), c = cmp.mapping.close() },
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    },
  }
})

-- require('luasnip').filetype_extend("javascript", { "javascriptreact" })
-- require('luasnip').filetype_extend("javascript", { "html" })
-- require('luasnip').filetype_extend("javascript", { "gsap" })


require('Comment').setup({
    ---Add a space b/w comment and the line
    padding = true,
    ---Whether the cursor should stay at its position
    sticky = true,
    ---Lines to be ignored while (un)comment
    ignore = nil,
    ---LHS of toggle mappings in NORMAL mode
    toggler = {
        ---Line-comment toggle keymap
        line = 'gcc',
        ---Block-comment toggle keymap
        block = 'gbc',
    },
    ---LHS of operator-pending mappings in NORMAL and VISUAL mode
    opleader = {
        ---Line-comment keymap
        line = 'gc',
        ---Block-comment keymap
        block = 'gb',
    },
    ---LHS of extra mappings
    extra = {
        ---Add comment on the line above
        above = 'gcO',
        ---Add comment on the line below
        below = 'gco',
        ---Add comment at the end of line
        eol = 'gcA',
    },
    ---Enable keybindings
    ---NOTE: If given `false` then the plugin won't create any mappings
    mappings = {
        ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
        basic = true,
        ---Extra mapping; `gco`, `gcO`, `gcA`
        extra = true,
    },
    ---Function to call before (un)comment
    pre_hook = nil,
    ---Function to call after (un)comment
    post_hook = nil,
})


vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]

vim.api.nvim_set_keymap('n', '<leader>pl', ':lua require"plink".ncopy()<CR>', { noremap = true })
vim.api.nvim_set_keymap('v', '<leader>pl', ':lua require"plink".vcopy()<CR>', { noremap = true })


-- require("cmp").config.formatting = {
--   format = require("tailwindcss-colorizer-cmp").formatter
-- }

local opt = vim.opt

opt.autowrite = true
-- opt.clipboard = "unnamedplus"
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 2
opt.confirm = true
opt.cursorline = true
opt.expandtab = true 
-- opt.formatoptions = "jcroqlnt" 
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.ignorecase = true
opt.inccommand = "nosplit"
opt.laststatus = 3
opt.list = true
opt.mouse = "a" 
opt.number = true
opt.pumblend = 10
opt.pumheight = 10
opt.relativenumber = true 
opt.scrolloff = 4
opt.showtabline= 2
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
-- opt.sessionoptions = 'curdir,folds,globals,help,tabpages,terminal,winsize'
opt.shiftround = true 
opt.shiftwidth = 2 
opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.showmode = false 
opt.sidescrolloff = 8
opt.signcolumn = "yes"
opt.smartcase = true
opt.smartindent = true
opt.spelllang = { "en" }
opt.splitbelow = true 
opt.splitkeep = "screen"
opt.splitright = true 
opt.tabstop = 2
opt.termguicolors = true 
-- opt.timeoutlen = 300
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 
opt.virtualedit = "block" 
opt.wildmode = "longest:full,full"
opt.winminwidth = 5 
opt.wrap = false
opt.fillchars = {
  foldopen = "",
  foldclose = "",
  -- fold = "⸱",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
--Which-key opts
opt.timeout = true
opt.timeoutlen = 300

if vim.fn.has("nvim-0.10") == 1 then
  opt.smoothscroll = true
end


-- -- opt.wrap=false
-- opt.laststatus= 2
-- opt.showtabline= 2
-- opt.relativenumber = true
-- opt.cursorline = true
-- opt.cursorcolumn = true
-- opt.mouse = "a"
-- opt.clipboard = "unnamedplus"
-- opt.smartcase = true
-- opt.tabstop = 1
-- opt.shiftwidth = 0
-- opt.expandtab = true
-- opt.number = true
-- opt.textwidth = 100
-- opt.linebreak = true
-- opt.scrolloff = 0
-- opt.cmdheight = 0
-- opt.showmode = false
-- opt.numberwidth = 1
-- opt.smartindent = true
-- opt.completeopt = "menuone,noselect"
-- opt.completeopt = {"menuone", "longest", "preview"}
-- opt.signcolumn = "yes"
-- opt.termguicolors = true
-- opt.spelllang = "en_gb,en_us"
-- opt.mousemodel = "popup"
-- opt.timeoutlen = 500
-- -- vim.o.guifont = "Victor Mono Nerd Font:h11"



-- highlight on yank
vim.cmd([[au TextYankPost * silent! lua vim.highlight.on_yank()]])
-- Vertically center document when entering insert mode
-- vim.cmd([[autocmd InsertEnter * norm zz]])
-- detect mdx file and set file type to markdown
vim.cmd([[autocmd BufNewFile,BufRead *.mdx set filetype=markdown.mdx]])
--format document on save using lsp
-- vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]








vim.o.foldcolumn = '0'
vim.o.foldlevel = 99 
vim.o.foldlevelstart = 99
vim.o.foldenable = true

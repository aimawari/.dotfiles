--------------------------------------------------------------------------------
-- Core Options
--------------------------------------------------------------------------------
vim.opt.number           = true               -- Absolute line numbers
vim.opt.relativenumber   = true               -- Relative line numbers
vim.opt.signcolumn       = 'yes'              -- Always show sign column
vim.opt.cursorline       = true               -- Highlight current line
vim.opt.termguicolors    = true               -- True color support
vim.opt.colorcolumn      = "80"               -- Column marker at 80 characters
vim.opt.scrolloff        = 8                  -- Minimum lines above/below cursor
vim.opt.sidescrolloff    = 8                  -- Minimum columns left/right of cursor
vim.opt.mouse            = "a"                -- Enable mouse
vim.opt.clipboard        = "unnamedplus"      -- Use system clipboard

--------------------------------------------------------------------------------
-- Invisible Characters
--------------------------------------------------------------------------------
vim.opt.list             = true
vim.opt.listchars        = {
  tab = '» ',
  trail = '·',
  extends = '›',
  precedes = '‹',
  nbsp = '␣',
}

--------------------------------------------------------------------------------
-- Search Behavior
--------------------------------------------------------------------------------
vim.opt.ignorecase       = true               -- Case-insensitive search
vim.opt.smartcase        = true               -- ...unless capital letters used
vim.opt.incsearch        = true               -- Incremental search
vim.opt.hlsearch         = false              -- Do not highlight all matches
vim.opt.inccommand       = 'split'            -- Live preview of :s

--------------------------------------------------------------------------------
-- Indentation & Tabs
--------------------------------------------------------------------------------
vim.opt.expandtab        = true               -- Use spaces instead of tabs
vim.opt.tabstop          = 4                  -- Tab width
vim.opt.softtabstop      = 4                  -- Tab width on insert
vim.opt.shiftwidth       = 4                  -- Indent width
vim.opt.smartindent      = true               -- Autoindent based on syntax
vim.opt.autoindent       = true
vim.opt.breakindent      = true               -- Wrapped lines maintain indent
vim.opt.wrap             = false              -- No wrapping by default

--------------------------------------------------------------------------------
-- Undo/Backup/Swap
--------------------------------------------------------------------------------
vim.opt.backup           = false
vim.opt.writebackup      = false
vim.opt.swapfile         = false
vim.opt.undodir          = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile         = true               -- Persistent undo history

--------------------------------------------------------------------------------
-- Performance
--------------------------------------------------------------------------------
vim.opt.timeoutlen       = 500                -- Shorter wait time for mappings
vim.opt.updatetime       = 50                 -- CursorHold delay
vim.opt.lazyredraw       = true               -- Faster macro execution

--------------------------------------------------------------------------------
-- File Handling
--------------------------------------------------------------------------------
vim.opt.isfname:append("@-@")                 -- Allow @ in file names

--------------------------------------------------------------------------------
-- Netrw Settings (if using)
--------------------------------------------------------------------------------
vim.g.netrw_browse_split = 0
vim.g.netrw_banner       = 0
vim.g.netrw_winsize      = 25
vim.g.netrw_hide         = 1
vim.g.netrw_list_hide    = [[\.DS_Store$,\.git$,node_modules,.idea,.vscode]]

--------------------------------------------------------------------------------
-- UI Quality of Life: Cursor Shape for Modes (in GUIs and Kitty/Alacritty)
--------------------------------------------------------------------------------
vim.opt.guicursor = table.concat({
  "n-v-c:block",
  "i-ci-ve:ver25",
  "r-cr:hor20",
  "o:hor50",
  "a:blinkon100",
}, ",")

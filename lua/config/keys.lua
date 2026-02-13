function map(mode, lhs, rhs, description, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    if description then
        options.desc = description
    end
    vim.keymap.set(mode, lhs, rhs, options)
end


-- Telescope
map('n', '<leader><leader>', ':Telescope find_files <CR>', 'Find files')
map('n', '<leader>lg', ':Telescope live_grep <CR>', 'Live grep')

-- LSP
map('n', '<leader>gd', ':lua vim.lsp.buf.definition()<CR>', 'LSP definition')
map('n', '<leader>gi', ':lua vim.lsp.buf.implementation()<CR>', 'LSP implementation')
map('n', 'K', ':lua vim.lsp.buf.hover()<CR>', 'LSP Buf Hover')
map('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>', 'LSP Buf Rename')
map('n', '<leader>gr', ':lua vim.lsp.buf.references()<CR>', 'LSP Buf References')

-- Neotree
map('n', '<leader>e', ':Neotree Toggle <CR>', 'File browser')

-- Navigation between splits
map('n', '<C-h>', '<C-w>h')
map('n', '<C-l>', '<C-w>l')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-j>', '<C-w>j')
map('t', '<C-h>', '<cmd>wincmd h<CR>"')
map('t', '<C-j>', '<cmd>wincmd j<CR>"')
map('t', '<C-k>', '<cmd>wincmd k<CR>"')
map('t', '<C-l>', '<cmd>wincmd l<CR>"')

-- Resizing splits
map("n", "<C-Up>", ":resize -2<CR>")
map("n", "<C-Down>", ":resize +2<CR>")
map("n", "<C-Left>", ":vertical resize -2<CR>")
map("n", "<C-Right>", ":vertical resize +2<CR>")
map("t", "<C-Up>", "<cmd>resize -2<CR>")
map("t", "<C-Down>", "<cmd>resize +2<CR>")
map("t", "<C-Left>", "<cmd>vertical resize -2<CR>")
map("t", "<C-Right>", "<cmd>vertical resize +2<CR>")

-- Move lines
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("v", "H", "<gv")
map("v", "L", ">gv")

-- Toggle Terminal
map('n', '<C-/>', function()
  require("toggleterm").toggle(0)
end, "Toggle terminal")


-- Toggle Term even in "T" mode
map('t', '<C-/>', function()
  require("toggleterm").toggle(0)
end, "Toggle terminal")


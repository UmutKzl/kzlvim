# Add Language Support

## Add LSP Support
Edit [lua/plugins/mason-lspconfig.lua](../lua/plugins/mason-lspconfig.lua) file to add your own LSP. You have to edit `ensure_installed` line.

## Add TreeSitter Support
Edit [lua/plugins/treesitter.lua](../lua/plugins/treesitter.lua) file to add TreeSitter. You have to edit `require'nvim-treesitter'.install` line.

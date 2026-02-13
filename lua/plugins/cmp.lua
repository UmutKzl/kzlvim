return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "neovim/nvim-lspconfig",

      -- completion sources
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",

      -- vsnip
      "hrsh7th/vim-vsnip",
      "hrsh7th/cmp-vsnip",

      -- Optional snippet engines (commented, same as your original)
      -- "L3MON4D3/LuaSnip",
      -- "saadparwaiz1/cmp_luasnip",
      -- "SirVer/ultisnips",
      -- "quangnguyen30192/cmp-nvim-ultisnips",
      -- "dcampos/nvim-snippy",
      -- "dcampos/cmp-snippy",
    },
    config = function()
      local cmp = require("cmp")

      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
            -- require("luasnip").lsp_expand(args.body)
            -- require("snippy").expand_snippet(args.body)
            -- vim.fn["UltiSnips#Anon"](args.body)
          end,
        },
        window = {
          -- completion = cmp.config.window.bordered(),
          -- documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "vsnip" },
        }, {
          { name = "buffer" },
        }),
      })
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
        matching = { disallow_symbol_nonprefix_matching = false },
      })
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Example LSP setup (replace with your servers)
      -- require("lspconfig").lua_ls.setup({
      --   capabilities = capabilities,
      -- })

      -- If you're using vim.lsp.enable (Neovim 0.10+):
      -- vim.lsp.config("lua_ls", { capabilities = capabilities })
      -- vim.lsp.enable("lua_ls")
    end,
  },
}

local packer = require('packer')
packer.use({'https://github.com/neovim/nvim-lspconfig'})

local lsp = {}

-- The on_attach function should be called when a buffer attaches to the LSP.
lsp.on_attach = function(client, bufnr)
  -- Enable manual completion using omnifunction.
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  require('keybindings').activate_lsp_buffer_bindings(bufnr)
end

-- Enable auto completion.
packer.use({
  'https://github.com/hrsh7th/nvim-cmp',
  requires = {
    'https://github.com/hrsh7th/cmp-nvim-lsp', 'https://github.com/hrsh7th/cmp-buffer',
    'https://github.com/hrsh7th/vim-vsnip'
  },
  config = function()
    local cmp = require('cmp')
    local kind_icons = {
      Text = "",
      Method = "",
      Function = "",
      Constructor = "",
      Field = "",
      Variable = "",
      Class = "☂",
      Interface = "",
      Module = "",
      Property = "⟲",
      Unit = "",
      Value = "",
      Enum = "",
      Keyword = "",
      Snippet = "",
      Color = "",
      File = "",
      Reference = "",
      Folder = "",
      EnumMember = "",
      Constant = "",
      Struct = "",
      Event = "",
      Operator = "",
      TypeParameter = ""
    }
    cmp.setup({
      snippet = {expand = function(args) vim.fn["vsnip#anonymous"](args.body) end},
      sources = cmp.config.sources({{name = 'nvim_lsp'}, {name = 'buffer'}}),
      formatting = {
        -- Show icon followed by source
        format = function(entry, vim_item)
          vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
          vim_item.menu = ({nvim_lsp = "[LSP]", buffer = "[Buffer]"})[entry.source.name]
          return vim_item
        end
      },
      mapping = {
        ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
        ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'})
      }
    })
  end
})

lsp.capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol
                                                                   .make_client_capabilities())

return lsp

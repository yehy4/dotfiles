require('packer').use({
  'https://github.com/hrsh7th/nvim-cmp',
  requires = {
    'https://github.com/hrsh7th/cmp-nvim-lsp', 'https://github.com/hrsh7th/cmp-buffer',
    'https://github.com/dcampos/nvim-snippy', 'https://github.com/dcampos/cmp-snippy'
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
    require('snippy').setup({
      mappings = {is = {['<Tab>'] = 'expand_or_advance', ['<S-Tab>'] = 'previous'}}
    })
    cmp.setup({
      snippet = {expand = function(args) require('snippy').expand_snippet(args.body) end},
      sources = cmp.config.sources({{name = 'nvim_lsp'}, {name = 'snippy'}, {name = 'buffer'}}),
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

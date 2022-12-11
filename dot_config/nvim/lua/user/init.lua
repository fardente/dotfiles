return {
  plugins = {
    init = { "catppuccin/nvim", "EdenEast/nightfox.nvim", "sainnhe/everforest", "Mofiqul/vscode.nvim",
      "martinsione/darkplus.nvim", "folke/tokyonight.nvim" },
    colorscheme = "catppuccin",
    cmp = function(opts)
      -- opts parameter is the default options table
      -- the function is lazy loaded so cmp is able to be required
      local cmp = require "cmp"
      -- modify the mapping part of the table
      opts.mapping["<C-f>"] = cmp.mapping.select_next_item()
      opts.formatting = { format = require('lspkind').cmp_format({
        mode = "symbol_text",
        menu = ({
          buffer = "[Buffer]",
          nvim_lsp = "[LSP]",
          luasnip = "[LuaSnip]",
          nvim_lua = "[Lua]",
          latex_symbols = "[Latex]",
        })
      }) }
      -- return the new table to be used
      return opts
    end,
  },
}
